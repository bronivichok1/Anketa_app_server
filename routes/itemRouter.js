const Router = require('express');
const router = new Router;
const itemController = require('../controllers/itemController');

router.post('/', itemController.create);
router.get('/', itemController.get);
router.get('/:id', itemController.getOne);
router.delete('/:id', itemController.delete);
router.put('/:id', itemController.update);
router.post('/test', itemController.test);
router.post('/res', itemController.countRes);
router.post('/close', itemController.closeItems);
router.post('/massiv', itemController.getMassivItems);

module.exports = router;