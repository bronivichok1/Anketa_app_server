const ApiError = require('../error/ApiError');
const { User, Item, Report, CathReport, Cathedra } = require('../models/models');

class RatingController {
    
    async create(req, res, next) {
        try {
           const {cathId} = req.body;
          
           let arr = [];

           const users = await User.findAll({ where: { cathedraId: cathId } });
           const cathName = await Cathedra.findOne({ where: { id: cathId } });

           if(users && users.length) {
            const itemStavkaId = await Item.findOne({ where: { name: 'Количество занимаемых ставок' } });
            const itemUchWorkId = await Item.findOne({ where: { name: 'УЧЕБНАЯ РАБОТА' } });
            const itemUchMetWorkId = await Item.findOne({ where: { name: 'УЧЕБНО-МЕТОДИЧЕСКАЯ РАБОТА' } });
            const itemDoljId = await Item.findOne({ where: { name: 'Должность' } });
            const itemStepenId = await Item.findOne({ where: { name: 'Ученая степень:' } });
            const itemAgeId = await Item.findOne({ where: { name: 'Возраст' } });

            const stavkaO = await CathReport.findOne({ where: { cathedraId: cathId, itemId: itemStavkaId.id } });
            const uchWorkO = await CathReport.findOne({ where: { cathedraId: cathId, itemId: itemUchWorkId.id } });
            const uchMetWorkO = await CathReport.findOne({ where: { cathedraId: cathId, itemId: itemUchMetWorkId.id } });
 
            const objReport = {id: 0, fullname: cathName.name, type: 'objReport',cathedraId: cathId, stavka: stavkaO.selectvalue,
            uchWork: Number(uchWorkO.ball_value/Number(stavkaO.selectvalue)).toFixed(2), uchMetWork: Number(uchMetWorkO.ball_value/Number(stavkaO.selectvalue)).toFixed(2)}

            arr.push(objReport)
        
            for (let i = 0; i < users.length; i++) {
                let us = users[i];
                const stavka = await Report.findOne({ where: { userId: us.id, itemId: itemStavkaId.id } });
                const uchWork = await Report.findOne({ where: { userId: us.id, itemId: itemUchWorkId.id } });
                const uchMetWork = await Report.findOne({ where: { userId: us.id, itemId: itemUchMetWorkId.id } });
                const dolj = await Report.findOne({ where: { userId: us.id, itemId: itemDoljId.id } });
                const stepen = await Report.findOne({ where: { userId: us.id, itemId: itemStepenId.id } });
                const age = await Report.findOne({ where: { userId: us.id, itemId: itemAgeId.id } });
   
               let obj = {id: i + 1, userId: us.id, fullname: us.fullname, cathedraId: cathId, stavka: stavka.selectvalue,
               uchWork: Number(uchWork.ball_value).toFixed(2), uchMetWork: Number(uchMetWork.ball_value/Number(stavka.selectvalue)).toFixed(2),
               dolj: dolj.selectvalue, stepen: stepen.selectvalue, age: age.selectvalue}
   
                arr.push(obj);
            }

            console.log(arr)
           }

           return res.json(arr);
        } catch (e) {
            next(ApiError.badRequest(e.message));
        }
    }

}

module.exports = new RatingController();