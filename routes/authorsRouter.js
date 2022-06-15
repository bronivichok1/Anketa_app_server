const Router = require('express');
const router = new Router;
const authorsController = require('../controllers/authorsController');
const checkRole = require('../middleware/checkRoleMiddleware');

router.post('/', authorsController.create);
router.get('/', authorsController.get);
router.delete('/:id', authorsController.delete);
router.put('/:id', authorsController.update);
router.get('/:id', authorsController.getOne);

module.exports = router;