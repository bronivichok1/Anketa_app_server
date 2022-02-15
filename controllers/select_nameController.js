const ApiError = require('../error/ApiError');
const { Select_name } = require('../models/models');

class Select_nameController {
    
    async create(req, res, next) {
        try {
            const {name, select_help, ball, itemId} = req.body;
            const select_name = await Select_name.create({name, select_help, ball, itemId});
            return res.json(select_name);
         } catch (e) {
             next(ApiError.badRequest(e.message));
         }
    }

    async get(req, res) {
        //const {id} = req.params;
        const selects = await Select_name.findAll();
        return res.json(selects);
    }

    async delete(req, res, next) {
        try {
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const select_name = await Select_name.destroy({
                where: { id: id }
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
            const updatedSelect = await Select_name.update(select, {
                where: {id: id},
            })
            
            return res.json(updatedSelect);
        } catch(e) {
            
            next(ApiError.badRequest(e.message));
        }
    }

}

module.exports = new Select_nameController();