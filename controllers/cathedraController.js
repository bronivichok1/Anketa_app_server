const ApiError = require('../error/ApiError');
const { Cathedra } = require('../models/models');

class CathedraController {
    
    async create(req, res, next) {
        try {
           const {name, user_name} = req.body;
           const cathedra = await Cathedra.create({name, user_name});
           return res.json(cathedra);
        } catch (e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async get(req, res) {
        const cathedras = await Cathedra.findAll();
        return res.json(cathedras);
    }

    async delete(req, res, next) {
        try {
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const cathedra = await Cathedra.destroy({
                where: { id: id }
              });
            return res.json(cathedra);
        } catch(e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async update(req, res, next) {
        try {
            const id = req.params.id;
            const cathedra = req.body;
            if (!cathedra.id) {
                res.status(400).json( {message: 'Id не указан'});
            }
            const updatedCath = await Cathedra.update(cathedra, {
                where: {id: id},
            })
            
            return res.json(updatedCath);
        } catch(e) {
            
            next(ApiError.badRequest(e.message));
        }
    }

}

module.exports = new CathedraController();