const Router = require('express');
const router = new Router;
const reportController = require('../controllers/reportController');

router.post('/', reportController.create);
router.get('/', reportController.get);
router.delete('/:id', reportController.delete);
router.put('/:id', reportController.update);

module.exports = router;