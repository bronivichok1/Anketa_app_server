const ApiError = require('../error/ApiError');
const { CathedralResponsible } = require('../models/models');

class CathResponsiblesController {
    
    async create(req, res, next) {
        try {
           const {cathedraId, userId} = req.body;
           console.log("create responsible " + cathedraId + " " + userId);
           const cathValue = await CathedralResponsible.create({cathedraId: cathedraId, userId: userId});
           console.log("cath value ");
           return res.json(cathValue);
        } catch (e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async get(req, res) {
        console.log("get all users");
        const types = await CathedralResponsible.findAll({
            order: [
              ['cathedraId'],
          ]
          });
        return res.json(types);
    }

    async delete(req, res, next) {
        try {
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const type = await CathedralResponsible.destroy({
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
            const updatedType = await CathedralResponsible.update(type, {
                where: {id: id},
            })
            
            return res.json(updatedType);
        } catch(e) {
            
            next(ApiError.badRequest(e.message));
        }
    }

    async getOne(req, res) {
        const {userId} = req.params;
        const type = await CathValue.findOne({
            where: {userId}
        })
        return res.json(type);
      }

}

module.exports = new CathResponsiblesController();