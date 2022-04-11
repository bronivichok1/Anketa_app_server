const ApiError = require('../error/ApiError');
const { Report } = require('../models/models');

class ReportController {
    
    async create(req, res, next) {
        try {
            const {value, ball_value, userId, itemId, resultId, selectvalue} = req.body;
            const report = await Report.create({value, ball_value, userId, itemId, resultId, selectvalue});
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

            // const candidate = await Report.findOne({
            //     where: {id: id}
            // })

            const updatedReport = await Report.update(report, {
                where: {id: id},
            })

            // if(candidate) {
            //     const updatedReport = await Report.update(report, {
            //         where: {id: id},
            //     })
            //     return res.json(updatedReport);
            // } else {
            //     const {value, ball_value, userId, itemId, resultId, selectvalue} = report;
            //     const rep = await Report.create({value, ball_value, userId, itemId, resultId, selectvalue});
            //     return res.json(rep);
            // }

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


}

module.exports = new ReportController();