const ApiError = require("../error/ApiError");
const { UserCathedra } = require("../models/models");

class UserCathedrasController {

  async getAll(req, res) {
    try {
      const { id } = req.params;
      if (!id) {
        res.status(400).json({ message: "Id не указан" });
      }
      const items = await UserCathedra.findAll({
        where: { userId: id }
      })
      const cathedras = [];
      items.forEach((item) => {
        cathedras.push(item.cathedraId);
      })
      return res.json(cathedras);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async update(req, res, next) {
    try {
      const { id } = req.params;
      const { cathedraIDs } = req.body;
      if (!id) {
        res.status(400).json({ message: 'Id не указан' });
      }
      await UserCathedra.destroy({
        where: { userId: id }
      });
      let addedUsers = new Array(cathedraIDs.length).fill({});
      for (let i = 0; i < cathedraIDs.length; i++) {
        let cathedraId = cathedraIDs[i];
        addedUsers[i] = await UserCathedra.create({ userId: id, cathedraId: cathedraId });
      }
      return res.json(addedUsers);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

}

module.exports = new UserCathedrasController();
