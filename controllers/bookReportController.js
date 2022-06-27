const ApiError = require('../error/ApiError');
const { Book_Report, Books, Authors } = require('../models/models');

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
      
      async createReport(req, res) {
        try {
            const {books, cathId} = req.body;

            const bookReport = await Book_Report.create({cathedra_id: cathId});

            books.forEach(async el => {
                const book = await Books.create({name: el.name, type: el.type, item_id: el.item_id, protocol_num: el.protocol_num, magaz_or_collection: el.magaz_or_collection, database: el.database, colvo_authors: el.colvo_authors, book_report_id: bookReport.id});

                el.authors.forEach(async authEl => {
                    const auth = await Authors.create({name: authEl.name, books_id: book.id, book_report_id: bookReport.id});
                })
            })
          
            return res.json(bookReport);
         } catch (e) {
             next(ApiError.badRequest(e.message));
         }
      }

      async editReport(req, res) {
        try {
            const {books, bookReportId, deletedBooks, deletedAuthors} = req.body;

            const bookReport = await Book_Report.findOne({
                where: {id: bookReportId}
            })

           if(deletedAuthors && deletedAuthors.length) {
            deletedAuthors.forEach(async auth => {
                const cand = await Authors.findOne({
                    where: {id: auth}
                })
                if (cand) {
                    Authors.destroy({ where: { id: cand.id }});
                }
            })
           }

            if (deletedBooks && deletedBooks.length) {
                deletedBooks.forEach(async book => {
                    const cand = await Books.findOne({
                        where: {id: book}
                    })
                    if (cand) {
                        Books.destroy({ where: { id: cand.id }});
                    }
                })
            }

            books.forEach(async el => {
                const candidate = await Books.findOne({
                    where: {id: el.id}
                })

                if (candidate) {
                   const updatedBook = await Books.update({...candidate, name: el.name, type: el.type, protocol_num: el.protocol_num, magaz_or_collection: el.magaz_or_collection, database: el.database, colvo_authors: el.colvo_authors}, {
                        where: {id: el.id},
                   })
                   el.authors.forEach(async authEl => {
                    const cand = await Authors.findOne({
                        where: {id: authEl.id}
                    })

                    if(!cand) {
                        Authors.create({name: authEl.name, books_id: candidate.id, book_report_id: bookReportId});
                    }
                   })
                } else {
                    const book = await Books.create({name: el.name, type: el.type, item_id: el.item_id, protocol_num: el.protocol_num, magaz_or_collection: el.magaz_or_collection, database: el.database, colvo_authors: el.colvo_authors, book_report_id: bookReportId});

                    el.authors.forEach( authEl => {
                    Authors.create({name: authEl.name, books_id: book.id, book_report_id: bookReportId});
                    })
                }
            })
          
            return res.json(bookReport);
         } catch (e) {
             next(ApiError.badRequest(e.message));
         }
      }

      async getBooks(req, res) {
        try {
            const {id} = req.params;
            const booksReports = await Book_Report.findAll({
                where: {cathedra_id: id}
            })

            const report = booksReports[booksReports.length - 1];

            const books = await Books.findAll({
                where: {book_report_id: report.id}
            })

            return res.json(books);
         } catch (e) {
             next(ApiError.badRequest(e.message));
         }
      }
      

}

module.exports = new BookReportController();