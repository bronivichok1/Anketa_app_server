const ApiError = require('../error/ApiError');
const { Authors } = require('../models/models');

class AuthorsController {
    
    async create(req, res, next) {
        try {
            const {name, books_id, book_report_id} = req.body;
            const auth = await Authors.create({name, books_id, book_report_id});
            return res.json(auth);
         } catch (e) {
             next(ApiError.badRequest(e.message));
         }
    }

    async get(req, res) {
        const authors = await Authors.findAll();
        return res.json(authors);
    }

    async delete(req, res, next) {
        try {
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const auth = await Authors.destroy({
                where: { id: id }
              });
            return res.json(auth);
        } catch(e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async update(req, res, next) {
        try {
            const id = req.params.id;
            const auth = req.body;
            if (!auth.id) {
                res.status(400).json( {message: 'Id не указан'});
            }
            const updatedAuth = await Authors.update(auth, {
                where: {id: id},
            })
            
            return res.json(updatedAuth);
        } catch(e) {
            
            next(ApiError.badRequest(e.message));
        }
    }

    async getOne(req, res) {
        const {id} = req.params;
        const auth = await Authors.findOne({
            where: {id}
        })
        return res.json(auth);
      }
    
    async getByReport(req, res) {
        const {id} = req.params;
        const authors = await Authors.findAll({
            where: {book_report_id: id}
        })
        return res.json(authors);
    }

    async deleteByReport(req, res, next) {
        try {
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const auth = await Authors.destroy({
                where: { book_report_id: id }
              });
            return res.json(auth);
        } catch(e) {
            next(ApiError.badRequest(e.message));
        }
    }
      

}

module.exports = new AuthorsController();