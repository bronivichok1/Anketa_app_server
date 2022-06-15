const ApiError = require('../error/ApiError');
const { Books } = require('../models/models');

class BooksController {
    
    async create(req, res, next) {
        try {
            const {name, type, item_id, protocol_num, magaz_or_collection, database, colvo_authors, book_report_id} = req.body;
            const book = await Books.create({name, type, item_id, protocol_num, magaz_or_collection, database, colvo_authors, book_report_id});
            return res.json(book);
         } catch (e) {
             next(ApiError.badRequest(e.message));
         }
    }

    async get(req, res) {
        const books = await Books.findAll();
        return res.json(books);
    }

    async delete(req, res, next) {
        try {
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const book = await Books.destroy({
                where: { id: id }
              });
            return res.json(book);
        } catch(e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async update(req, res, next) {
        try {
            const id = req.params.id;
            const book = req.body;
            if (!book.id) {
                res.status(400).json( {message: 'Id не указан'});
            }
            const updatedBook = await Books.update(book, {
                where: {id: id},
            })
            
            return res.json(updatedBook);
        } catch(e) {
            
            next(ApiError.badRequest(e.message));
        }
    }

    async getOne(req, res) {
        const {id} = req.params;
        const book = await Books.findOne({
            where: {id}
        })
        return res.json(book);
      }
      

}

module.exports = new BooksController();