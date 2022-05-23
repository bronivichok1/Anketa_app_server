const ApiError = require('../error/ApiError');
const { ReportLocal, Item, MassivLocal } = require('../models/models');

class ReportLocalController {
    
    async create(req, res, next) {
        try {
            const {value, ball_value, userId, itemId, resultId, selectvalue} = req.body;
            const report = await ReportLocal.create({value, ball_value, userId, itemId, resultId, selectvalue});
            return res.json(report);
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
          const reports = await ReportLocal.findAll({
            where: { userId: id },
          });

          let stavka = '';
          let massivLocal = [];

          if(reports && reports.length) {
            const itemId = await Item.findOne({
                where: {name: "Количество занимаемых ставок"}
            });

           if(itemId) {
            stavka = await ReportLocal.findOne({
                where: {itemId: itemId.id}
            })
           }
             massivLocal = await MassivLocal.findAll({
                where: { userId: id },
              });
          }

          return res.json({reports: reports, stavka: stavka ? stavka.selectvalue : '', massivLocal: massivLocal});
        } catch (e) {
          next(ApiError.badRequest(e.message));
        }
      }

    async delete(req, res, next) {
        try {
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const report = await ReportLocal.destroy({
                where: { userId: id }
              });
            return res.json(report);
        } catch(e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async update(req, res, next) {
        try {
            const id = req.params.id;
            const report = req.body;
            if (!report.id) {
                res.status(400).json( {message: 'Id не указан'});
            }

            const updatedReport = await ReportLocal.update(report, {
                where: {id: id},
            })

            return res.json(updatedReport);
        } catch(e) {
            
            next(ApiError.badRequest(e.message));
        }
    }

    async getOne(req, res) {
        const {id} = req.params;
        const report = await ReportLocal.findOne({
            where: {itemId: id}
        })
        return res.json(report);
      }

      async deleteOne(req, res, next) {
        try {
            const {id} = req.params;
            if (!id) {
                res.status(400).json({message: "Id не указан"});
            }
            const report = await ReportLocal.destroy({
                where: { id: id }
              });
            return res.json(report);
        } catch(e) {
            next(ApiError.badRequest(e.message));
        }
    }

    async checkReports(req, res, next) {
        try {
            const {items, reports} = req.body;
            
            await reports.map(el => {
                items.map(i => {
                   if( i.id === el.itemId) {
                       i.vvod = el.value;
                       i.value = el.ball_value;
                       i.select = el.selectvalue;
                   }
                })
            })

            return res.json(items);
         } catch (e) {
             next(ApiError.badRequest(e.message));
         }
    }

    async saveReports(req, res, next) {
        try {
            const {items, reports, userId, itemMassivLocal, massivMassivLocal, massivDeletedLocal} = req.body;
            
            if(items.length > reports.length) {
                const arr = [];
                await items.forEach( async el => {
                  const t = await reports.find(rep => rep.itemId === el.id);
                  if(!t) {
                    arr.push(el);
                  }
                })
        
                 arr.forEach(async (d) => {

                const report = await ReportLocal.create({
                    selectvalue: d.select,
                    value: d.vvod,
                    ball_value: d.value,
                    userId: userId,
                    itemId: d.id,
                  });
                })
              }
              
              await reports.forEach(async rep => {
                const cont = items.find(i => i.id === rep.itemId);
                if(cont) {
                
                  const updatedReport = await ReportLocal.update({...rep,  selectvalue: cont.select,
                    value: cont.vvod,
                    ball_value: cont.value}, {
                    where: {id: rep.id},
                })
                } else {
                  const report = await ReportLocal.destroy({
                    where: { id: rep.id }
                  });
                }
                
              })
        
              for(let key in itemMassivLocal) {
                let itemId = await items.find(it => it.id == key).id;
        
                if(itemId) {
                  itemMassivLocal[key].forEach(async mas => {
                    if(massivMassivLocal.find(sm => sm.id === mas.id)) {
                      console.log('yes');
                     } else {
                       const massiv = await MassivLocal.create({value: Number(mas.val), userId: userId, itemId: itemId});
                     }
                  })
                }
              }
        
              if(massivDeletedLocal && massivDeletedLocal.length) {
                massivDeletedLocal.forEach(async el => {
                  const massiv = await MassivLocal.destroy({
                    where: { id: el },
                  });
                })
              }

            return res.json('ok');
         } catch (e) {
             next(ApiError.badRequest(e.message));
         }
    }



}

module.exports = new ReportLocalController();