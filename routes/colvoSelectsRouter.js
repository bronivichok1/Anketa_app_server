const Router = require('express');
const router = new Router;
const colvoSelectsController = require('../controllers/colvoSelectsController');
const checkRole = require('../middleware/checkRoleMiddleware');

router.post('/', colvoSelectsController.create);
router.get('/', colvoSelectsController.get);
router.delete('/:id', colvoSelectsController.delete);
router.put('/:id', colvoSelectsController.update);
router.post('/find', colvoSelectsController.getAll);
router.get('/:id', colvoSelectsController.getOne);
router.delete('/res/:id', colvoSelectsController.deleteByRes);

module.exports = router;