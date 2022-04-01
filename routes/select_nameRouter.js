const Router = require('express');
const router = new Router;
const select_nameController = require('../controllers/select_nameController');
const checkRole = require('../middleware/checkRoleMiddleware');

router.post('/', select_nameController.create);
router.get('/', select_nameController.get);
router.delete('/:id', select_nameController.delete);
router.put('/:id', select_nameController.update);
router.post('/find', select_nameController.getAll);

module.exports = router;