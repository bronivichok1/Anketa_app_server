const Router = require('express');
const router = new Router;
const cathReportController = require('../controllers/cathReportController');

router.post('/', cathReportController.create);
router.get('/:id', cathReportController.get);
router.delete('/:id', cathReportController.delete);
router.put('/:id', cathReportController.update);
router.get('/stavka/:id', cathReportController.getOne);
router.delete('/one/:id', cathReportController.deleteOne);
router.post('/count', cathReportController.count);
router.get('/result/:id', cathReportController.getByResult);
router.get('/stav/:id', cathReportController.getStavka);
router.delete('/res/:id', cathReportController.deleteByRes);
router.post('/countReps', cathReportController.countCathReps);
router.post('/update', cathReportController.updateCathReport);

module.exports = router;