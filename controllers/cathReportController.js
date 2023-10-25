const ApiError = require('../error/ApiError');
const { CathReport, Report, Result, CathResult, Select_name, ColvoSelects, Item, Dates, Book_Report, Books } = require('../models/models');
var moment = require('moment');
moment().format();

class CathReportController {

  async create(req, res, next) {
    try {
      const { value, ball_value, cathedraId, itemId, selectvalue, colvo, cath_result_id } = req.body;
      const report = await CathReport.create({ value, ball_value, cathedraId, itemId, selectvalue, colvo, cath_result_id });
      return res.json(report);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async count(req, res, next) {
    try {
      const { cathedra_id } = req.body;

      let dates = await Dates.findAll();

      dates = dates[0];

      let resCand = await Result.findAll({ where: { cathedra_id } });

      let bookReport = await Book_Report.findAll({ where: { cathedra_id } });
      let books = [];

      if (bookReport && bookReport.length) {
        bookReport = bookReport[bookReport.length - 1];

        books = await Books.findAll({ where: { book_report_id: bookReport.id } });
      }

      if (resCand && resCand.length) {
        resCand = resCand.filter(r => moment(r.createdAt).isBetween(dates.firstDate, dates.lastDate, undefined, '[]'))
      }

      let candidate = await Report.findAll({ where: { cathedra_id } });

      if (candidate && candidate.length) {
        candidate = candidate.filter(r => moment(r.createdAt).isBetween(dates.firstDate, dates.lastDate, undefined, '[]'))
      }

      const item = await Item.findOne({ where: { name: 'Количество занимаемых ставок' } })

      let resultt;

      if (resCand && resCand.length) {
        let res = 0;
        resCand.forEach((r) => {
          res += Number(r.result ? r.result : 0);
        });

        resultt = await CathResult.create({ result: res, cathedraId: cathedra_id });

        resCand.forEach(async el => {
          const updatedResult = await Result.update({ ...el, cath_result_id: resultt.id }, {
            where: { id: el.id },
          })
        })

      }

      if (bookReport && !Array.isArray(bookReport) && resultt) {
        Book_Report.update({ ...bookReport, cath_result_id: resultt.id }, {
          where: { id: bookReport.id },
        })
      }

      const obj = {};
      const arr = [];

      if (candidate && candidate.length) {
        candidate.forEach(el => {
          if (obj.hasOwnProperty(el.itemId)) {
            obj[el.itemId] = [...obj[el.itemId], el]
          } else {
            obj[el.itemId] = [el]
          }
        })

        for (let key in obj) {
          let value = 0;
          let ball_value = 0;
          let colvo = 0;
          let selectvalue = [];
          let stavka = 0;

          if (key == item.id) {
            await obj[key].forEach(k => {
              stavka += k.selectvalue ? Number(k.selectvalue) : 0;
              value += k.value ? Number(k.value) : 0;
              ball_value += k.ball_value ? Number(k.ball_value) : 0;
              colvo += k.ball_value ? 1 : 0;
              selectvalue.push(k.selectvalue);
            })
          } else {
            await obj[key].forEach(k => {
              value += k.value ? Number(k.value) : 0;
              ball_value += k.ball_value ? Number(k.ball_value) : 0;
              colvo += k.ball_value ? 1 : 0;
              selectvalue.push(k.selectvalue);
            })
          }

          arr.push({ selectvalue: selectvalue, itemId: Number(key) });
          console.log(stavka);

          let bookLength;

          if (books.find(b => b.item_id === Number(key))) {
            bookLength = books.filter(b => b.item_id === Number(key)).length;
          }

          if (key == item.id) {
            const report = await CathReport.create({ value: value, ball_value: ball_value, cathedraId: cathedra_id, itemId: Number(key), colvo: colvo, selectvalue: stavka.toString(), cath_result_id: resultt.id })
          } else if (bookLength) {
            const report = await CathReport.create({ value: value, ball_value: ball_value, cathedraId: cathedra_id, itemId: Number(key), colvo: bookLength, cath_result_id: resultt.id })
          }
          else {
            const report = await CathReport.create({ value: value, ball_value: ball_value, cathedraId: cathedra_id, itemId: Number(key), colvo: colvo, cath_result_id: resultt.id })
          }

        }

        arr.forEach(el => {
          el.selectvalue.forEach(async el2 => {
            if (el2) {
              const select = await Select_name.findOne({ where: { name: el2, itemId: el.itemId } });
              if (select) {
                const colvoSel = await ColvoSelects.create({ select_namesId: select.id, cathedra_id, cath_result_id: resultt.id })
              }
            }
          })
        })

      }

      return res.json(resultt);
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
      const reports = await CathReport.findAll({
        where: { cathedraId: id },
      });
      return res.json(reports);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async getByResult(req, res, next) {
    try {
      const { id } = req.params;
      if (!id) {
        res.status(400).json({ message: "Id не указан" });
      }
      const reports = await CathReport.findAll({
        where: { cath_result_id: id },
      });
      return res.json(reports);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async getStavka(req, res, next) {
    try {
      const { id } = req.params;
      if (!id) {
        res.status(400).json({ message: "Id не указан" });
      }
      const reports = await CathReport.findOne({
        where: { itemId: id },
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
      const report = await CathReport.destroy({
        where: { cathedraId: id }
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
      const report = await CathReport.destroy({
        where: { cath_result_id: id }
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

      const updatedReport = await CathReport.update(report, {
        where: { id: id },
      })

      return res.json(updatedReport);
    } catch (e) {

      next(ApiError.badRequest(e.message));
    }
  }

  async getOne(req, res) {
    const { id } = req.params;
    const report = await CathReport.findOne({
      where: { cathedraId: id }
    })
    return res.json(report);
  }

  async deleteOne(req, res, next) {
    try {
      const { id } = req.params;
      if (!id) {
        res.status(400).json({ message: "Id не указан" });
      }
      const report = await CathReport.destroy({
        where: { id: id }
      });
      return res.json(report);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async countCathReps(req, res, next) {
    try {
      const { items, reports } = req.body;

      await reports.map((el) => {
        items.forEach(i => {
          if (i.id === el.itemId) {
            i.vvod = el.value;
            i.value = el.ball_value;
            i.colvo = el.colvo;
          }
        })
      });

      return res.json(items);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async updateCathReport(req, res, next) {
    try {
      const { itemItems, CathReportReports, itemStavka } = req.body;

      const itemId = await itemItems.find(i => i.name === 'Количество занимаемых ставок').id;

      if (itemId) {
        const el = await CathReportReports.find(c => c.itemId === itemId);
        if (el) {
          const updatedReport = await CathReport.update({ ...el, selectvalue: itemStavka }, {
            where: { id: el.id },
          })
        }
      }

      await CathReportReports.forEach(async rep => {
        const itemm = await itemItems.find(i => i.id === rep.itemId);

        if (itemm) {
          const updatedReport = await CathReport.update({ ...rep, colvo: itemm.colvo }, {
            where: { id: rep.id },
          })
        }
      })


      return res.json('ok');
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

}

module.exports = new CathReportController();