const ApiError = require('../error/ApiError');
const { Cath_type } = require('../models/models');

class Cath_typeController {
    
    async create(req, res, next) {
        try {
           const {name} = req.body;
           const cath_type = await Cath_type.create({name});
           return res.json(cath_type);
        } catch (e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async get(req, res) {
        const types = await Cath_type.findAll();
        return res.json(types);
    }

    async delete(req, res, next) {
        try {
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const type = await Cath_type.destroy({
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
            const updatedType = await Cath_type.update(type, {
                where: {id: id},
            })
            
            return res.json(updatedType);
        } catch(e) {
            
            next(ApiError.badRequest(e.message));
        }
    }

    async getOne(req, res) {
        const {id} = req.params;
        const type = await Cath_type.findOne({
            where: {id}
        })
        return res.json(type);
      }

}

module.exports = new Cath_typeController();