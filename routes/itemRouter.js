const Router = require('express');
const router = new Router;
const itemController = require('../controllers/itemController');

router.post('/', itemController.create);
router.get('/', itemController.get);
router.delete('/:id', itemController.delete);
router.put('/:id', itemController.update);

module.exports = router;