const ApiError = require('../error/ApiError');
const { CathResult, Dates, CathReport, Result, Item, Report, Select_name, ColvoSelects } = require('../models/models');
var moment = require('moment'); 
moment().format(); 

class CathResultController {
    
    async create(req, res, next) {
        try {
            const {result, cathedraId } = req.body;
            // const candidate = await CathResult.findOne({ where: { cathedraId } });
            // if (candidate) {
            //   return next(ApiError.badRequest("Ваш отчёт уже добавлен!"));
            // }
            const resultt = await CathResult.create({result, cathedraId});
            return res.json(resultt);
         } catch (e) {
             next(ApiError.badRequest(e.message));
         }
    }

    async countRes(req, res, next) {
        try {
         const {cath_result_id} = req.body;
 
         const cathResult = await CathResult.findOne({
             where: {id: cath_result_id}
         })

         const result = await Result.findAll({ where: { cath_result_id: cath_result_id } });

         let reports = [];

         if(result && result.length) {
            result.forEach(async el => {
               const reps = await Report.findAll({ where: { resultId: el.id } });

               reports = [...reports, ...reps];
            })
         }

         console.log(reports);
         const item = await Item.findOne({ where: {name: 'Количество занимаемых ставок'} });

         let resultt;

         if(result && result.length) {
             let res = 0;
             result.forEach((r) => {
               res += Number(r.result ? r.result : 0);
             });

          resultt = await CathResult.update({...cathResult, result: res}, {
            where: {id: cathResult.id},
          });
         }

         const obj = {};
         const arr = [];

            if(reports && reports.length) {
                reports.forEach( el => {
                    if (obj.hasOwnProperty(el.itemId)) {
                        obj[el.itemId] = [...obj[el.itemId], el]
                    } else {
                     obj[el.itemId] = [el]
                    }
                 })

               for (let key in obj) {
               let value = 0;
               let ball_value = 0;
               let colvo = 0;
               let selectvalue = [];
               let stavka = 0;

               if(key == item.id) {
                await obj[key].forEach(k => {
                    stavka += k.selectvalue ? Number(k.selectvalue) : 0;
                    value += k.value ? Number(k.value) : 0;
                    ball_value += k.ball_value ? Number(k.ball_value) : 0;
                    colvo += k.ball_value ? 1 : 0;
                    selectvalue.push(k.selectvalue);
                   })
               } else {
                await obj[key].forEach(k => {
                    value += k.value ? Number(k.value) : 0;
                    ball_value += k.ball_value ? Number(k.ball_value) : 0;
                    colvo += k.ball_value ? 1 : 0;
                    selectvalue.push(k.selectvalue);
                   })
               }
            
            arr.push({selectvalue: selectvalue, itemId: Number(key) });
            console.log(stavka);

            if(key == item.id) {
                const report = await CathReport.create({value: value, ball_value: ball_value, cathedraId: cathResult.cathedraId, itemId: Number(key), colvo: colvo, selectvalue: stavka.toString(), cath_result_id: cathResult.id })
            } else {
                const report = await CathReport.create({value: value, ball_value: ball_value, cathedraId: cathResult.cathedraId, itemId: Number(key), colvo: colvo, cath_result_id: cathResult.id })
            }
           
            }

            arr.forEach(el => {
                el.selectvalue.forEach(async el2 => {
                    if(el2) {
                        const select = await Select_name.findOne({ where: { name: el2, itemId: el.itemId } });
                        if (select) {
                            const colvoSel = await ColvoSelects.create({select_namesId: select.id, cathedra_id: cathResult.cathedraId, cath_result_id: cathResult.id})
                        }
                    }
                })
            })

            }
 
         return res.json(resultt);
        } catch(e) {
             
         next(ApiError.badRequest(e.message));
     }
       }

    async get(req, res) {
        const results = await CathResult.findAll();
        return res.json(results);
    }

    async delete(req, res, next) {
        try {
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const result = await CathResult.destroy({
                where: { id: id }
              });
            return res.json(result);
        } catch(e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async update(req, res, next) {
        try {
            const id = req.params.id;
            const result = req.body;
            if (!result.id) {
                res.status(400).json( {message: 'Id не указан'});
            }
            const updatedResult = await CathResult.update(result, {
                where: {id: id},
            })
            
            return res.json(updatedResult);
        } catch(e) {
            
            next(ApiError.badRequest(e.message));
        }
    }

    async getOne(req, res, next) {
       try {
        const {id} = req.params;

        const result = await CathResult.findAll({
            where: {cathedraId: id}
        })

        return res.json(result);
       } catch(e) {
            
        next(ApiError.badRequest(e.message));
    }
      }

      async getResActive(req, res, next) {
        try {
         const {id} = req.params;
 
         let dates = await Dates.findAll();
 
         dates = dates[0];
 
         let result = await CathResult.findAll({
             where: {cathedraId: id}
         })
 
         if (result && result.length) {
           result = result.filter(r => moment(r.createdAt).isBetween(dates.firstDate, dates.lastDate, undefined, '[]'))
         }
 
         if (result && result.length) {
            return res.json(result);
         } else {
             return res.json([]);
         }
        } catch(e) {
             
         next(ApiError.badRequest(e.message));
     }
       }

      async getOneOwn(req, res, next) {
        try {
         const {id} = req.params;
         const result = await CathResult.findOne({
             where: {id: id}
         })
         return res.json(result);
        } catch(e) {
             
         next(ApiError.badRequest(e.message));
     }
       }

}

module.exports = new CathResultController();