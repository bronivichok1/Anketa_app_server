const Router = require('express');
const router = new Router;
const reportController = require('../controllers/reportController');

router.post('/', reportController.create);
router.get('/:id', reportController.get);
router.delete('/:id', reportController.delete);
router.put('/:id', reportController.update);
router.get('/stavka/:id', reportController.getOne);
router.delete('/one/:id', reportController.deleteOne);
router.get('/cath/:id', reportController.getByCath);

module.exports = router;