const ApiError = require('../error/ApiError');
const { User, Item, Report, CathReport, Cathedra, CathResult, Result } = require('../models/models');
var moment = require('moment'); 
moment().format(); 

class RatingController {
    
    async create(req, res, next) {
        try {
           const {cathId, startDate, endDate} = req.body;

           console.log(startDate)
           console.log(endDate)
          
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
            const itemNauchWorkId = await Item.findOne({ where: { name: 'НАУЧНО-ИССЛЕДОВАТЕЛЬСКАЯ РАБОТА' } });
            const itemVospitWorkId = await Item.findOne({ where: { name: 'ВОСПИТАТЕЛЬНАЯ, ИДЕОЛОГИЧЕСКАЯ, СПОРТИВНО-МАССОВАЯ И ПРОФОРИЕНТАЦИОННАЯ РАБОТА' } });
            const itemLechWorkId = await Item.findOne({ where: { name: 'ЛЕЧЕБНО-ДИАГНОСТИЧЕСКАЯ И КОНСУЛЬТАЦИОННАЯ РАБОТА' } });
            const itemMejWorkId = await Item.findOne({ where: { name: 'Международная работа' } });
            const itemIndXirshId = await Item.findOne({ where: { name: 'Индекс Хирша в соответствии с российским индексом научного цитирования (расчет на сайте elibrary.ru)' } });
            const itemIndXirshScopId = await Item.findOne({ where: { name: 'Индекс Хирша в соответствии с наукометрической базой Scopus' } });
            const itemColvoScopId = await Item.findOne({ where: { name: 'Количество статей в научном журнале, проиндексированном международными базами данных SCOPUS, опубликованных за текущей отчетный период' } });
            const itemColvoWoSId = await Item.findOne({ where: { name: 'Количество статей в научном журнале, проиндексированном международными базами данных Web of Science, опубликованных за текущей отчетный период' } });
            const itemCovidWorkId = await Item.findOne({ where: { name: 'Работа по COVID-19' } });

            let cathRes = await CathResult.findAll({where: {cathedraId: cathId}});

            if(startDate && endDate && cathRes && cathRes.length) {
             cathRes = cathRes.filter(r => moment(r.createdAt).isBetween(startDate, endDate, undefined, '[]') === true);
            }



           if (cathRes && cathRes.length) {
            cathRes = cathRes[cathRes.length - 1];

            const cathReports = await CathReport.findAll({ where: {cath_result_id: cathRes.id}});

            let stavkaO;
            if (itemStavkaId) {
                stavkaO = cathReports.find(el => el.itemId === itemStavkaId.id);
            }
           // const stavkaO = cathReports.find(el => el.itemId === itemStavkaId.id);
           let uchWorkO;
           if (itemUchWorkId) {
            uchWorkO = cathReports.find(el => el.itemId === itemUchWorkId.id);
           }
           // const uchWorkO = cathReports.find(el => el.itemId === itemUchWorkId.id);
           let uchMetWorkO;
           if (itemUchMetWorkId) {
            uchMetWorkO = cathReports.find(el => el.itemId === itemUchMetWorkId.id);
           }
           // const uchMetWorkO = cathReports.find(el => el.itemId === itemUchMetWorkId.id);
           let nauchWorkO;
           if (itemNauchWorkId) {
            nauchWorkO = cathReports.find(el => el.itemId === itemNauchWorkId.id);
           }
           // const nauchWorkO = cathReports.find(el => el.itemId === itemNauchWorkId.id);
           let vospitWorkO;
           if (itemVospitWorkId) {
            vospitWorkO = cathReports.find(el => el.itemId === itemVospitWorkId.id);
           }
            //const vospitWorkO = cathReports.find(el => el.itemId === itemVospitWorkId.id);
            let lechWorkO;
            if (itemLechWorkId) {
                lechWorkO = cathReports.find(el => el.itemId === itemLechWorkId.id);
            }
            //const lechWorkO = cathReports.find(el => el.itemId === itemLechWorkId.id);
            let mejWorkO;
            if (itemMejWorkId) {
                mejWorkO = cathReports.find(el => el.itemId === itemMejWorkId.id);
            }
           // const mejWorkO = cathReports.find(el => el.itemId === itemMejWorkId.id);
           let indXirshO;
           if (itemIndXirshId) {
            indXirshO = cathReports.find(el => el.itemId === itemIndXirshId.id);
           }
            //const indXirshO = cathReports.find(el => el.itemId === itemIndXirshId.id);
            let indXirshScopO;
            if (itemIndXirshScopId) {
                indXirshScopO = cathReports.find(el => el.itemId === itemIndXirshScopId.id);
            }
            //const indXirshScopO = cathReports.find(el => el.itemId === itemIndXirshScopId.id);
            let colvoScopO;
            if (itemColvoScopId) {
                colvoScopO = cathReports.find(el => el.itemId === itemColvoScopId.id);
            }
           // const colvoScopO = cathReports.find(el => el.itemId === itemColvoScopId.id);
           let colvoWoSO;
           if (itemColvoWoSId) {
             colvoWoSO = cathReports.find(el => el.itemId === itemColvoWoSId.id);
           }
            //const colvoWoSO = cathReports.find(el => el.itemId === itemColvoWoSId.id);
            let covidWorkO;
            if (itemCovidWorkId) {
                covidWorkO = cathReports.find(el => el.itemId === itemCovidWorkId.id);
            }
           // const covidWorkO = cathReports.find(el => el.itemId === itemCovidWorkId.id);
 
            const objReport = {id: 0, fullname: cathName.name, type: 'objReport',cathedraId: cathId, 
            stavka: stavkaO ? stavkaO.selectvalue : 0,
            uchWork: uchWorkO && stavkaO && Number(stavkaO.selectvalue) ? Number(uchWorkO.ball_value/Number(stavkaO.selectvalue)).toFixed(2) : 0, 
            uchMetWork: uchMetWorkO && stavkaO && Number(stavkaO.selectvalue) ? Number(uchMetWorkO.ball_value/Number(stavkaO.selectvalue)).toFixed(2) : 0,
            nauchWork: nauchWorkO && stavkaO && Number(stavkaO.selectvalue) ? Number(nauchWorkO.ball_value/Number(stavkaO.selectvalue)).toFixed(2) : 0,
            vospitWork: vospitWorkO && stavkaO && Number(stavkaO.selectvalue) ? Number(vospitWorkO.ball_value/Number(stavkaO.selectvalue)).toFixed(2) : 0,
            lechWork: lechWorkO && stavkaO && Number(stavkaO.selectvalue) ? Number(lechWorkO.ball_value/Number(stavkaO.selectvalue)).toFixed(2) : 0,
            mejWork: mejWorkO && stavkaO && Number(stavkaO.selectvalue) ? Number(mejWorkO.ball_value/Number(stavkaO.selectvalue)).toFixed(2) : 0,
            indXirsh: indXirshO && stavkaO && Number(stavkaO.selectvalue) ? Number(indXirshO.ball_value/Number(stavkaO.selectvalue)).toFixed(2) : 0,
            indXirshScop: indXirshScopO && stavkaO && Number(stavkaO.selectvalue) ? Number(indXirshScopO.ball_value/Number(stavkaO.selectvalue)).toFixed(2) : 0,
            colvoScop: colvoScopO && stavkaO && Number(stavkaO.selectvalue) ? Number(colvoScopO.ball_value/Number(stavkaO.selectvalue)).toFixed(2) : 0,
            colvoWoS: colvoWoSO && stavkaO && Number(stavkaO.selectvalue) ? Number(colvoWoSO.ball_value/Number(stavkaO.selectvalue)).toFixed(2) : 0,
            covidWork: covidWorkO && stavkaO && Number(stavkaO.selectvalue) ? Number(covidWorkO.ball_value/Number(stavkaO.selectvalue)).toFixed(2) : 0,
        }

            arr.push(objReport)
           }
        
            for (let i = 0; i < users.length; i++) {
                let us = users[i];
                let ownRes = await Result.findAll({where: {cathedra_id: cathId, userId: us.id}});

                if(startDate && endDate && ownRes && ownRes.length) {
                   ownRes = ownRes.filter(r => moment(r.createdAt).isBetween(startDate, endDate, undefined, '[]'));
                 }

                if(ownRes && ownRes.length) {

                    const ownReports = await Report.findAll({where: {resultId: ownRes[ownRes.length - 1].id}});

                    if(ownReports && ownReports.length) {
    
                        let stavka;
                        if (itemStavkaId) {
                            stavka = ownReports.find(el => el.itemId === itemStavkaId.id);
                        }
                        //const stavka = ownReports.find(el => el.itemId === itemStavkaId.id);
                        let uchWork;
                        if (itemUchWorkId) {
                            uchWork = ownReports.find(el => el.itemId === itemUchWorkId.id);
                        }
                        //const uchWork = ownReports.find(el => el.itemId === itemUchWorkId.id);
                        let uchMetWork;
                        if (itemUchMetWorkId) {
                            uchMetWork = ownReports.find(el => el.itemId === itemUchMetWorkId.id);
                        }
                        //const uchMetWork = ownReports.find(el => el.itemId === itemUchMetWorkId.id);
                        let dolj;
                        if (itemDoljId) {
                            dolj = ownReports.find(el => el.itemId === itemDoljId.id);
                        }
                        //const dolj = ownReports.find(el => el.itemId === itemDoljId.id);
                        let stepen;
                        if (itemStepenId) {
                            stepen = ownReports.find(el => el.itemId === itemStepenId.id);
                        }
                        //const stepen = ownReports.find(el => el.itemId === itemStepenId.id);
                        let age;
                        if (itemAgeId) {
                            age = ownReports.find(el => el.itemId === itemAgeId.id);
                        }
                        //const age = ownReports.find(el => el.itemId === itemAgeId.id);
                        let nauchWork;
                        if (itemNauchWorkId) {
                            nauchWork = ownReports.find(el => el.itemId === itemNauchWorkId.id);
                        }
                        //const nauchWork = ownReports.find(el => el.itemId === itemNauchWorkId.id);
                        let vospitWork;
                        if (itemVospitWorkId) {
                            vospitWork = ownReports.find(el => el.itemId === itemVospitWorkId.id);
                        }
                        //const vospitWork = ownReports.find(el => el.itemId === itemVospitWorkId.id);
                        let lechWork;
                        if (itemLechWorkId) {
                            lechWork = ownReports.find(el => el.itemId === itemLechWorkId.id);
                        }
                        //const lechWork = ownReports.find(el => el.itemId === itemLechWorkId.id);
                        let mejWork;
                        if (itemMejWorkId) {
                            mejWork = ownReports.find(el => el.itemId === itemMejWorkId.id);
                        }
                        //const mejWork = ownReports.find(el => el.itemId === itemMejWorkId.id);
                        let indXirsh;
                        if (itemIndXirshId) {
                            indXirsh = ownReports.find(el => el.itemId === itemIndXirshId.id);
                        }
                        //const indXirsh = ownReports.find(el => el.itemId === itemIndXirshId.id);
                        let indXirshScop;
                        if (itemIndXirshScopId) {
                            indXirshScop = ownReports.find(el => el.itemId === itemIndXirshScopId.id);
                        }
                        //const indXirshScop = ownReports.find(el => el.itemId === itemIndXirshScopId.id);
                        let colvoScop;
                        if (itemColvoScopId) {
                            colvoScop = ownReports.find(el => el.itemId === itemColvoScopId.id);
                        }
                       // const colvoScop = ownReports.find(el => el.itemId === itemColvoScopId.id);
                       let colvoWoS;
                       if (itemColvoWoSId) {
                        colvoWoS = ownReports.find(el => el.itemId === itemColvoWoSId.id);
                       }
                        //const colvoWoS = ownReports.find(el => el.itemId === itemColvoWoSId.id);
                        let covidWork;
                        if (itemCovidWorkId) {
                            covidWork = ownReports.find(el => el.itemId === itemCovidWorkId.id);
                        }
                        //const covidWork = ownReports.find(el => el.itemId === itemCovidWorkId.id);
           
                       let obj = {id: i + 1, userId: us.id, fullname: us.fullname, cathedraId: cathId, 
                       stavka: stavka ? stavka.selectvalue : 0,
                       uchWork: uchWork ? Number(uchWork.ball_value).toFixed(2) : 0, 
                       uchMetWork: uchMetWork && stavka && Number(stavka.selectvalue) ? Number(uchMetWork.ball_value/Number(stavka.selectvalue)).toFixed(2) : 0,
                       dolj: dolj ? dolj.selectvalue : '', stepen: stepen ? stepen.selectvalue : '', 
                        age: age ? age.selectvalue : '',
                        nauchWork: nauchWork && stavka && Number(stavka.selectvalue) ? Number(nauchWork.ball_value/Number(stavka.selectvalue)).toFixed(2) : 0,
                        vospitWork: vospitWork && stavka && Number(stavka.selectvalue) ? Number(vospitWork.ball_value/Number(stavka.selectvalue)).toFixed(2) : 0,
                        lechWork: lechWork ? Number(lechWork.ball_value).toFixed(2) : 0,
                        mejWork: mejWork && stavka && Number(stavka.selectvalue) ? Number(mejWork.ball_value/Number(stavka.selectvalue)).toFixed(2) : 0,
                        indXirsh: indXirsh ? Number(indXirsh.ball_value).toFixed(2) : 0,
                        indXirshScop: indXirshScop ? Number(indXirshScop.ball_value).toFixed(2) : 0,
                        colvoScop: colvoScop ? Number(colvoScop.ball_value).toFixed(2) : 0,
                        colvoWoS: colvoWoS ? Number(colvoWoS.ball_value).toFixed(2) : 0,
                        covidWork: covidWork ? Number(covidWork.ball_value).toFixed(2) : 0,
                    }
           
                        arr.push(obj);
                    }
                }
               
            }
           }

           return res.json(arr);
        } catch (e) {
            next(ApiError.badRequest(e.message));
        }
    }

}

module.exports = new RatingController();