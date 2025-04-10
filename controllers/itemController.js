const ApiError = require("../error/ApiError");
const { Item } = require("../models/models");
const {Sequelize} = require("sequelize")
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

async function childFunc (arr) {
 await arr.forEach((el) => {
    arr.forEach((el2) => {
      if (el.id === el2.parentId) {
         el.children = el.children ? [...el.children, el2] : [el2];
      }
    });
  });

  return arr;
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

    let resultArr = [];
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

  async test(req, res, next) {
    try {
      const {items} = req.body;
    
      await items.forEach(async (el) => {
      if(el.type === 'Сумма' && el.children && el.children.length && el.parentId === null) {
       let res = 0;
       let num = el.num;
 
       await items.forEach( child => {
         if(child.num.split('.')[0] === num.split('.')[0] && child.num.split('.').length > num.split('.').length ) {
          res += Number(child.value ? child.value : 0);
         }
       })
    
        el.value = Number(res.toFixed(2));
      }
     });

      return res.json(items);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async countRes(req, res, next) {
    try {
      const {items} = req.body;
    
      let rest = 0;
     await items.forEach((el) => {
      if(el.type !== 'Сумма') {
        rest += Number(el.value ? el.value : 0);
      }
      });

      return res.json(rest);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async closeItems(req, res, next) {
    try {
      const {items} = req.body;

     await items.forEach((el) => {
      items.forEach( (el2) => {

        let n = el2.num.split('.');
        n.pop();
        n = n.join('.')

        if (
          !el.clas &&
          el.num === n &&
          el2.num.split(".").length === el.num.split(".").length + 1 &&
          el2.clas
        ) {
          el2.clas = false;
          el.clasName = false;
        }
      });
    });

      return res.json(items);
    } catch (e) {
      next(ApiError.badRequest(e.message));
    }
  }

  async getMassivItems(req, res, next) {
    try {
        const items = await Item.findAll({
            where: { type: 'Массив данных' },
            order: [
                [Sequelize.literal(`string_to_array(num, '.')::int[]`)]
            ],
            raw: true
        });

        const itemIds = items.map(item => item.parentId).filter(Boolean);

        const parents = await Item.findAll({
            where: { id: itemIds },
            raw: true
        });

        const itemsWithParents = items.map(item => {
            const parent = parents.find(p => p.id === item.parentId);
            let parentInfo = null;

            if (parent) {
                parentInfo = String(parent.num) + ". " + parent.name;
            }

            return {
                ...item,
                parent: parent ? { ...parent, name: parentInfo } : null 
            };
        });

        return res.json(itemsWithParents);
    } catch (e) {
        next(ApiError.badRequest(e.message));
    }
}




}

module.exports = new ItemController();
