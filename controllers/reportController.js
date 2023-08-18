const ApiError = require('../error/ApiError');
const { Report, Result, Massiv, User, ReportLocal, MassivLocal, Dates, CathResult, CathReport, ColvoSelects } = require('../models/models');
var moment = require('moment');
moment().format();

class ReportController {

  async create(req, res, next) {
    try {
      const { value, ball_value, userId, itemId, resultId, selectvalue, cathedra_id } = req.body;
      const report = await Report.create({ value, ball_value, userId, itemId, resultId, selectvalue, cathedra_id });
      return res.json(report);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async get(req, res, next) {
    try {
      const { id } = req.params;
      if (!id) {
        res.status(400).json({ message: "Id не указан" });
      }
      const reports = await Report.findAll({
        where: { userId: id },
      });
      return res.json(reports);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async getByRes(req, res, next) {
    try {
      const { id } = req.params;
      if (!id) {
        res.status(400).json({ message: "Id не указан" });
      }
      const reports = await Report.findAll({
        where: { resultId: id },
      });
      return res.json(reports);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async getByCath(req, res, next) {
    try {
      const { id } = req.params;
      if (!id) {
        res.status(400).json({ message: "Id не указан" });
      }
      const reports = await Report.findAll({
        where: { cathedra_id: id },
      });
      return res.json(reports);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async delete(req, res, next) {
    try {
      const { id } = req.params;
      if (!id) {
        res.status(400).json({ message: "Id не указан" });
      }
      const report = await Report.destroy({
        where: { userId: id }
      });
      return res.json(report);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async deleteByRes(req, res, next) {
    try {
      const { id } = req.params;
      if (!id) {
        res.status(400).json({ message: "Id не указан" });
      }
      const report = await Report.destroy({
        where: { resultId: id }
      });
      return res.json(report);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }


  async update(req, res, next) {
    try {
      const id = req.params.id;
      const report = req.body;
      if (!report.id) {
        res.status(400).json({ message: 'Id не указан' });
      }

      const updatedReport = await Report.update(report, {
        where: { id: id },
      })

      return res.json(updatedReport);
    } catch (e) {

      next(ApiError.badRequest(e.message));
    }
  }

  async getOne(req, res) {
    const { id } = req.params;
    const report = await Report.findOne({
      where: { itemId: id }
    })
    return res.json(report);
  }

  async deleteOne(req, res, next) {
    try {
      const { id } = req.params;
      if (!id) {
        res.status(400).json({ message: "Id не указан" });
      }
      const report = await Report.destroy({
        where: { id: id }
      });
      return res.json(report);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async postAnketa(req, res, next) {
    try {
      const { userId, itemSym, items, massivLocal, localUser } = req.body;

      let dates = await Dates.findAll();

      dates = dates[0];

      let candidate = await Result.findAll({ where: { userId: userId, cathedra_id: localUser.cathedraId } });

      if (candidate && candidate.length) {
        candidate = candidate.filter(r => moment(r.createdAt).isBetween(dates.firstDate, dates.lastDate, undefined, '[]'));
      }

      const isAlreadyExists = candidate && candidate.length;
      if (isAlreadyExists) {
        console.log("Anketa exists");
        return next(ApiError.badRequest(`Ваша анкета за период с ${moment(dates.firstDate).format("DD.MM.YYYY")} по ${moment(dates.lastDate).format("DD.MM.YYYY")} уже существует!`));
      } else {
        const rest = await Result.create({ userId: userId, result: itemSym, cathedra_id: localUser.cathedraId });

        await items.forEach(async (d) => {

          const report = await Report.create({
            selectvalue: d.select,
            value: d.vvod,
            ball_value: d.value,
            userId: userId,
            itemId: d.id,
            cathedra_id: localUser.cathedraId,
            resultId: rest.id
          });

          for (let key in massivLocal) {
            if (massivLocal.hasOwnProperty(key)) {
              if (d.id == key) {
                massivLocal[key].forEach(async (el2) => {

                  const massiv = await Massiv.create({
                    value: el2.val,
                    userId: userId,
                    itemId: d.id,
                    result_id: rest.id,
                    name: el2.name
                  });
                });
              }
            }
          }

        });

        const updatedUser = await User.update(localUser, {
          where: { id: localUser.id },
        })

        const report = await ReportLocal.destroy({
          where: { userId: userId }
        });

        const massiv = await MassivLocal.destroy({
          where: { userId: userId },
        });

        let result = await CathResult.findAll({
          where: { cathedraId: localUser.cathedraId }
        })

        if (result && result.length) {
          result = result.filter(r => moment(r.createdAt).isBetween(dates.firstDate, dates.lastDate, undefined, '[]'))
        }

        if (result && result.length) {

          const cathResult = await CathResult.destroy({
            where: { id: result[0].id }
          });

          const cathReport = await CathReport.destroy({
            where: { cath_result_id: result[0].id }
          });

          const select_name = await ColvoSelects.destroy({
            where: { cath_result_id: result[0].id }
          });

        }

        return res.json('ok');
      }
    } catch (e) {
      console.log("post anketa error " + e.message);
      next(ApiError.badRequest(e.message));
    }
  }

  async updateAnketa(req, res, next) {
    try {
      const { itemResult, localUser, itemItems, reportReports, itemMassiv, massivMassiv, massivDeleted } = req.body;

      console.log("item results " + itemResult);
      let rest;

      rest = await Result.update({ ...itemResult, cathedra_id: localUser.cathedraId }, {
        where: { id: itemResult.id }
      });

      if (itemItems.length > reportReports.length) {
        const arr = [];
        await itemItems.forEach(async el => {
          const t = await reportReports.find(rep => rep.itemId === el.id);
          if (!t) {
            arr.push(el);
          }
        })

        arr.forEach(async (d) => {
          const report = await Report.create({
            selectvalue: d.select,
            value: d.vvod,
            ball_value: d.value,
            userId: itemResult.userId,
            itemId: d.id,
            cathedra_id: localUser.cathedraId,
            resultId: itemResult.id
          })

        })
      }

      await reportReports.forEach(async rep => {
        const cont = await itemItems.find(i => i.id === rep.itemId);
        if (cont) {
          const updatedReport = await Report.update({
            ...rep,
            selectvalue: cont.select,
            value: cont.vvod,
            ball_value: cont.value,
            cathedra_id: localUser.cathedraId
          }, {
            where: { id: rep.id },
          })
        } else {
          const report = await Report.destroy({
            where: { id: rep.id }
          });
        }

      })

      for (let key in itemMassiv) {
        let itemId = await itemItems.find(it => it.id == key).id;

        if (itemId) {
          itemMassiv[key].forEach(async mas => {
            if (massivMassiv.find(sm => sm.id === mas.id)) {
              console.log('yes');
            } else {
              const massiv = await Massiv.create({ value: Number(mas.val), userId: localUser.id, itemId: itemId, result_id: itemResult.id, name: mas.name });
            }
          })
        }
      }

      if (massivDeleted && massivDeleted.length) {
        massivDeleted.forEach(async el => {
          const massiv = await Massiv.destroy({
            where: { id: el },
          });
        })
      }

      const updatedUser = await User.update(localUser, {
        where: { id: localUser.id },
      })

      let dates = await Dates.findAll();

      dates = dates[0];

      let result = await CathResult.findAll({
        where: { cathedraId: localUser.cathedraId }
      })

      if (result && result.length) {
        result = result.filter(r => moment(r.createdAt).isBetween(dates.firstDate, dates.lastDate, undefined, '[]'))
      }

      if (result && result.length) {

        const cathResult = await CathResult.destroy({
          where: { id: result[0].id }
        });

        const cathReport = await CathReport.destroy({
          where: { cath_result_id: result[0].id }
        });

        const select_name = await ColvoSelects.destroy({
          where: { cath_result_id: result[0].id }
        });

      }

      return res.json('ok');
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }


}

module.exports = new ReportController();