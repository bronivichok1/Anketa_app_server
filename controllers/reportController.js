const ApiError = require('../error/ApiError');
const { Report } = require('../models/models');

class ReportController {
    
    async create(req, res, next) {
        try {
            const {value, ball_value, userId, itemId, resultId, selectvalue, cathedra_id} = req.body;
            const report = await Report.create({value, ball_value, userId, itemId, resultId, selectvalue, cathedra_id});
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
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const report = await Report.destroy({
                where: { userId: id }
              });
            return res.json(report);
        } catch(e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async update(req, res, next) {
        try {
            const id = req.params.id;
            const report = req.body;
            if (!report.id) {
                res.status(400).json( {message: 'Id не указан'});
            }

            const updatedReport = await Report.update(report, {
                where: {id: id},
            })

            return res.json(updatedReport);
        } catch(e) {
            
            next(ApiError.badRequest(e.message));
        }
    }

    async getOne(req, res) {
        const {id} = req.params;
        const report = await Report.findOne({
            where: {itemId: id}
        })
        return res.json(report);
      }

      async deleteOne(req, res, next) {
        try {
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const report = await Report.destroy({
                where: { id: id }
              });
            return res.json(report);
        } catch(e) {
            next(ApiError.badRequest(e.message));
        }
    }


}

module.exports = new ReportController();