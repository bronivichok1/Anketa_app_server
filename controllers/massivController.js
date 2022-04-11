const ApiError = require("../error/ApiError");
const { Massiv } = require("../models/models");

class MassivController {
  async create(req, res, next) {
    try {
      const { value, userId, itemId } = req.body;
      const massiv = await Massiv.create({ value, userId, itemId });
      return res.json(massiv);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async get(req, res, next) {
    try {
      const { id } = req.params;
      if (!id) {
        res.status(400).json({ message: "Id не указан" });
      }
      const massivs = await Massiv.findAll({
        where: { userId: id },
      });
      return res.json(massivs);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async update(req, res, next) {
    try {
      const id = req.params.id;
      const massiv = req.body;
      if (!massiv.id) {
        res.status(400).json({ message: "Id не указан" });
      }
      const updatedMassiv = await Massiv.update(massiv, {
        where: { id: id },
      });

      return res.json(updatedMassiv);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }


  async delete(req, res, next) {
    try {
      const { id } = req.params;
      if (!id) {
        res.status(400).json({ message: "Id не указан" });
      }
      const massiv = await Massiv.destroy({
        where: { userId: id },
      });
      return res.json(massiv);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }
}

module.exports = new MassivController();
