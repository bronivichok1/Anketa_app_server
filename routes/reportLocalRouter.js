const Router = require('express');
const router = new Router;
const reportLocalController = require('../controllers/reportLocalController');

router.post('/', reportLocalController.create);
router.get('/:id/:cathedraId?', reportLocalController.get);
router.delete('/:id/:cathedraId?', reportLocalController.delete);
router.put('/:id', reportLocalController.update);
router.get('/stavka/:id', reportLocalController.getOne);
router.delete('/one/:id', reportLocalController.deleteOne);
router.post('/check', reportLocalController.checkReports);
router.post('/save', reportLocalController.saveReports);

module.exports = router;