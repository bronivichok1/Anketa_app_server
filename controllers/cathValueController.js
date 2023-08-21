const ApiError = require('../error/ApiError');
const { CathValue } = require('../models/models');

class CathValueController {
    
    async create(req, res, next) {
        try {
           const {name} = req.body;
           const cathValue = await CathValue.create({name});
           return res.json(cathValue);
        } catch (e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async get(req, res) {
        const types = await CathValue.findAll();
        return res.json(types);
    }

    async delete(req, res, next) {
        try {
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const type = await CathValue.destroy({
                where: { id: id }
              });
            return res.json(type);
        } catch(e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async update(req, res, next) {
        try {
            const id = req.params.id;
            const type = req.body;
            if (!type.id) {
                res.status(400).json( {message: 'Id не указан'});
            }
            const updatedType = await CathValue.update(type, {
                where: {id: id},
            })
            
            return res.json(updatedType);
        } catch(e) {
            
            next(ApiError.badRequest(e.message));
        }
    }

    async getOne(req, res) {
        const {id} = req.params;
        const type = await CathValue.findOne({
            where: {id}
        })
        return res.json(type);
      }

}

module.exports = new CathValueController();