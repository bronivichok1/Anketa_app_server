const ApiError = require('../error/ApiError');
const { Book_Report } = require('../models/models');

class BookReportController {
    
    async create(req, res, next) {
        try {
            const {cathedra_id} = req.body;
            const book = await Book_Report.create({cathedra_id});
            return res.json(book);
         } catch (e) {
             next(ApiError.badRequest(e.message));
         }
    }

    async get(req, res) {
        const books = await Book_Report.findAll();
        return res.json(books);
    }

    async delete(req, res, next) {
        try {
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const book = await Book_Report.destroy({
                where: { id: id }
              });
            return res.json(book);
        } catch(e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async getOne(req, res) {
        const {id} = req.params;
        const book = await Book_Report.findOne({
            where: {id}
        })
        return res.json(book);
      }

      async getByCath(req, res) {
        try {
            const {id} = req.params;
            const books = await Book_Report.findAll({
                where: {cathedra_id: id}
            })
            return res.json(books);
         } catch (e) {
             next(ApiError.badRequest(e.message));
         }
      }
      

}

module.exports = new BookReportController();