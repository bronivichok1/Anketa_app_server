const ApiError = require('../error/ApiError');
const { Dates } = require('../models/models');

class DatesController {
    
    async create(req, res, next) {
        try {
           const {lastDate, firstDate} = req.body;
           const date = await Dates.create({lastDate, firstDate});
           return res.json(date);
        } catch (e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async get(req, res) {
        const dates = await Dates.findAll();
        return res.json(dates);
    }

    async delete(req, res, next) {
        try {
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const date = await Dates.destroy({
                where: { id: id }
              });
            return res.json(date);
        } catch(e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async update(req, res, next) {
        try {
            const id = req.params.id;
            const date = req.body;
            if (!date.id) {
                res.status(400).json( {message: 'Id не указан'});
            }
            const updatedDates = await Dates.update(date, {
                where: {id: id},
            })
            
            return res.json(updatedDates);
        } catch(e) {
            
            next(ApiError.badRequest(e.message));
        }
    }

    async getOne(req, res) {
        const {id} = req.params;
        const date = await Dates.findOne({
            where: {id}
        })
        return res.json(date);
      }

}

module.exports = new DatesController();