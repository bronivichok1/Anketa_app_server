const ApiError = require('../error/ApiError');
const { ColvoSelects } = require('../models/models');

class ColvoSelectsController {
    
    async create(req, res, next) {
        try {
            const {ball, colvo, select_namesId, cathedra_id, cath_result_id} = req.body;
            const colvoSel = await ColvoSelects.create({ball, colvo, select_namesId, cathedra_id, cath_result_id});
            return res.json(colvoSel);
         } catch (e) {
             next(ApiError.badRequest(e.message));
         }
    }

    async get(req, res) {
        const selects = await ColvoSelects.findAll();
        return res.json(selects);
    }

    async getAll(req, res, next) {
        try {
          const {id} = req.body;
          console.log(id);
          const names = await ColvoSelects.findAll({
              where: { cath_result_id: id }
            });
          return res.json(names);
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
            const select_name = await ColvoSelects.destroy({
                where: { cathedra_id: id }
              });
            return res.json(select_name);
        } catch(e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async update(req, res, next) {
        try {
            const id = req.params.id;
            const select = req.body;
            if (!select.id) {
                res.status(400).json( {message: 'Id не указан'});
            }
            const updatedSelect = await ColvoSelects.update(select, {
                where: {id: id},
            })
            
            return res.json(updatedSelect);
        } catch(e) {
            
            next(ApiError.badRequest(e.message));
        }
    }

    async getOne(req, res) {
        const {id} = req.params;
        const sel = await ColvoSelects.findOne({
            where: {id}
        })
        return res.json(sel);
      }
      

}

module.exports = new ColvoSelectsController();