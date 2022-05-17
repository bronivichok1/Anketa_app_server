const ApiError = require("../error/ApiError");
const { Item } = require("../models/models");

function createTree(arr) {
  if (!arr || !arr.length) { return []; }
  var tree = [], map = new Map();
  for (var i = 0, len = arr.length; i < len; ++i) {
    var item = arr[i];
    var mapItem = map.get(item.id);
    if (!mapItem || Array.isArray(mapItem)) {
      if (mapItem) {
        item.children = mapItem;
      }
      map.set(item.id, item);
    }
    if (item.parentId == null) {
      tree.push(item);
    } else {
      var parentItem = map.get(item.parentId);
      if (!parentItem) {
        map.set(item.parentId, [item]);
      } else {
        var children = Array.isArray(parentItem) ?
          parentItem :
          (parentItem.children = parentItem.children || []);
        children.push(item);
      }
    }
  }
  return tree;
}

function sortTree(arr) {

  arr.sort((a, b) => a.order - b.order);

  arr.forEach(el => {
    if (el.children && el.children.length) {
      sortTree(el.children);
    }
  })

  return arr;
}

function getSortedArr(arr) {

  let newArr = [];

  arr.forEach(el => {
    newArr.push(el.num);

    if(el.children && el.children.length) {
      const testArr = getSortedArr(el.children);

      newArr = [...newArr, ...testArr];
    }
  })

  return newArr;

}



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

    const resultArr = [];
    const items = await Item.findAll({
      order: [
        ['num'],
    ]
    });

    items.forEach(item => {
      item.order = Number(item.num.split('.')[item.num.split('.').length - 1]);
    })
  
    const arr = createTree(items);

    await sortTree(arr);

    const newArr = getSortedArr(arr);
    const newItems = await Item.findAll();

    newArr.forEach( el => {
       const item = newItems.find(i => i.num === el);

      if(item) {
        resultArr.push(item);
      }
    })
    
    return res.json(resultArr);
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
