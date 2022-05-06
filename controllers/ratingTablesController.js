const ApiError = require('../error/ApiError');
const { RatingTables } = require('../models/models');

class RatingTablesController {
    
    async create(req, res, next) {
        try {
           const {name, formula, active} = req.body;
           const table = await RatingTables.create({name, formula, active});
           return res.json(table);
        } catch (e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async get(req, res) {
        const tables = await RatingTables.findAll({
            order: [
              ['id'],
          ]
          });
        return res.json(tables);
    }

    async getTrue(req, res) {
       try {
        const tables = await RatingTables.findAll({
            where: {active: true},
            order: [
                ['id'],
            ]
          });
        return res.json(tables);
       } catch(e) {
        next(ApiError.badRequest(e.message));
       }
    }


    async delete(req, res, next) {
        try {
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const table = await RatingTables.destroy({
                where: { id: id }
              });
            return res.json(table);
        } catch(e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async update(req, res, next) {
        try {
            const id = req.params.id;
            const table = req.body;
            if (!table.id) {
                res.status(400).json( {message: 'Id не указан'});
            }
            const updatedTable = await RatingTables.update(table, {
                where: {id: id},
            })
            
            return res.json(updatedTable);
        } catch(e) {
            
            next(ApiError.badRequest(e.message));
        }
    }

    async getOne(req, res) {
        const {id} = req.params;
        const table = await RatingTables.findOne({
            where: {id}
        })
        return res.json(table);
      }

}

module.exports = new RatingTablesController();