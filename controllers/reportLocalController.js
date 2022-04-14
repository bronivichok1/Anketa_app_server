const ApiError = require('../error/ApiError');
const { ReportLocal } = require('../models/models');

class ReportLocalController {
    
    async create(req, res, next) {
        try {
            const {value, ball_value, userId, itemId, resultId, selectvalue} = req.body;
            const report = await ReportLocal.create({value, ball_value, userId, itemId, resultId, selectvalue});
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
          const reports = await ReportLocal.findAll({
            where: { userId: id },
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
            const report = await ReportLocal.destroy({
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

            const updatedReport = await ReportLocal.update(report, {
                where: {id: id},
            })

            return res.json(updatedReport);
        } catch(e) {
            
            next(ApiError.badRequest(e.message));
        }
    }

    async getOne(req, res) {
        const {id} = req.params;
        const report = await ReportLocal.findOne({
            where: {itemId: id}
        })
        return res.json(report);
      }


}

module.exports = new ReportLocalController();