const Router = require('express');
const router = new Router;
const facultyController= require('../controllers/facultyController');
const checkRole = require('../middleware/checkRoleMiddleware');

router.post('/', facultyController.create);
router.get('/', facultyController.get);
router.delete('/:id', facultyController.delete);
router.put('/:id', facultyController.update);
router.get('/:id', facultyController.getOne);

module.exports = router;