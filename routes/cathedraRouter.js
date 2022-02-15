const Router = require('express');
const router = new Router;
const cathedraController = require('../controllers/cathedraController');
const checkRole = require('../middleware/checkRoleMiddleware');

router.post('/', checkRole('ADMIN'), cathedraController.create);
router.get('/', cathedraController.get);
router.delete('/:id', cathedraController.delete);
router.put('/:id', cathedraController.update);

module.exports = router;