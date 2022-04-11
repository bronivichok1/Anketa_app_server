const ApiError = require("../error/ApiError");
const { Item } = require("../models/models");

class ItemController {
  async create(req, res, next) {
    try {
      const { name, num, ball, help, formula, type, formula_comment } =
        req.body;

    let parentId = null;

    if (num.split('.').length > 1) {
        const arr = await num.split('.');
        await arr.pop();
        const parentNum = await arr.join('.');
        const parentItem = await Item.findOne({ where: { num: parentNum } });
        if (parentItem) {
            parentId = parentItem.id;
        }
    }

      const item = await Item.create({
        name,
        num,
        ball,
        help,
        formula,
        type,
        formula_comment,
        parentId,
      });
      return res.json(item);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async get(req, res) {
    const items = await Item.findAll({
      order: [
        ['num']
    ]
    });
    return res.json(items);
  }

  async delete(req, res, next) {
    try {
      const { id } = req.params;
      if (!id) {
        res.status(400).json({ message: "Id не указан" });
      }
      const item = await Item.destroy({
        where: { id: id },
      });
      return res.json(item);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async update(req, res, next) {
    try {
      const id = req.params.id;
      const item = req.body;
      if (!item.id) {
        res.status(400).json({ message: "Id не указан" });
      }
      const updatedItem = await Item.update(item, {
        where: { id: id },
      });

      return res.json(updatedItem);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async getOne(req, res) {
    const {id} = req.params;
    const item = await Item.findOne({
        where: {id}
    })
    return res.json(item);
  }
}



module.exports = new ItemController();
