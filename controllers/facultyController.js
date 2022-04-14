const ApiError = require('../error/ApiError');
const { Faculty } = require('../models/models');

class FacultyController {
    
    async create(req, res, next) {
        try {
           const {name} = req.body;
           const faculty = await Faculty.create({name});
           return res.json(faculty);
        } catch (e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async get(req, res) {
        const faculties = await Faculty.findAll();
        return res.json(faculties);
    }

    async delete(req, res, next) {
        try {
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const faculty = await Faculty.destroy({
                where: { id: id }
              });
            return res.json(faculty);
        } catch(e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async update(req, res, next) {
        try {
            const id = req.params.id;
            const faculty = req.body;
            if (!faculty.id) {
                res.status(400).json( {message: 'Id не указан'});
            }
            const updatedFaculty = await Faculty.update(faculty, {
                where: {id: id},
            })
            
            return res.json(updatedFaculty);
        } catch(e) {
            
            next(ApiError.badRequest(e.message));
        }
    }

    async getOne(req, res) {
        const {id} = req.params;
        const faculty = await Faculty.findOne({
            where: {id}
        })
        return res.json(faculty);
      }

}

module.exports = new FacultyController();