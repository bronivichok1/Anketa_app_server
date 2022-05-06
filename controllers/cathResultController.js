const ApiError = require('../error/ApiError');
const { CathResult, Dates } = require('../models/models');
var moment = require('moment'); 
moment().format(); 

class CathResultController {
    
    async create(req, res, next) {
        try {
            const {result, cathedraId } = req.body;
            // const candidate = await CathResult.findOne({ where: { cathedraId } });
            // if (candidate) {
            //   return next(ApiError.badRequest("Ваш отчёт уже добавлен!"));
            // }
            const resultt = await CathResult.create({result, cathedraId});
            return res.json(resultt);
         } catch (e) {
             next(ApiError.badRequest(e.message));
         }
    }

    async get(req, res) {
        const results = await CathResult.findAll();
        return res.json(results);
    }

    async delete(req, res, next) {
        try {
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const result = await CathResult.destroy({
                where: { id: id }
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
            const updatedResult = await CathResult.update(result, {
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

        const result = await CathResult.findAll({
            where: {cathedraId: id}
        })

        return res.json(result);
       } catch(e) {
            
        next(ApiError.badRequest(e.message));
    }
      }

      async getResActive(req, res, next) {
        try {
         const {id} = req.params;
 
         let dates = await Dates.findAll();
 
         dates = dates[0];
 
         const result = await CathResult.findAll({
             where: {cathedraId: id}
         })
 
         result.filter(r => moment(r.createdAt).isBetween(dates.firstDate, dates.lastDate, undefined, '[]'))
 
         return res.json(result);
        } catch(e) {
             
         next(ApiError.badRequest(e.message));
     }
       }

      async getOneOwn(req, res, next) {
        try {
         const {id} = req.params;
         const result = await CathResult.findOne({
             where: {id: id}
         })
         return res.json(result);
        } catch(e) {
             
         next(ApiError.badRequest(e.message));
     }
       }

}

module.exports = new CathResultController();