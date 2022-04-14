const ApiError = require('../error/ApiError');
const { Result } = require('../models/models');

class ResultController {
    
    async create(req, res, next) {
        try {
            const {result, userId } = req.body;
            const candidate = await Result.findOne({ where: { userId } });
            if (candidate) {
              return next(ApiError.badRequest("Ваша анкета уже добавлена!"));
            }
            const resultt = await Result.create({result, userId});
            return res.json(resultt);
         } catch (e) {
             next(ApiError.badRequest(e.message));
         }
    }

    async get(req, res) {
        const results = await Result.findAll();
        return res.json(results);
    }

    async delete(req, res, next) {
        try {
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const result = await Result.destroy({
                where: { userId: id }
              });
            return res.json(result);
        } catch(e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async update(req, res, next) {
        try {
            const id = req.params.id;
            const result = req.body;
            if (!result.id) {
                res.status(400).json( {message: 'Id не указан'});
            }
            const updatedResult = await Result.update(result, {
                where: {id: id},
            })
            
            return res.json(updatedResult);
        } catch(e) {
            
            next(ApiError.badRequest(e.message));
        }
    }

    async getOne(req, res, next) {
       try {
        const {id} = req.params;
        const result = await Result.findOne({
            where: {userId: id}
        })
        return res.json(result);
       } catch(e) {
            
        next(ApiError.badRequest(e.message));
    }
      }

}

module.exports = new ResultController();