const Router = require('express');
const router = new Router;
const ratingTablesController= require('../controllers/ratingTablesController');
const checkRole = require('../middleware/checkRoleMiddleware');

router.post('/', ratingTablesController.create);
router.get('/', ratingTablesController.get);
router.delete('/:id', ratingTablesController.delete);
router.put('/:id', ratingTablesController.update);
router.get('/:id', ratingTablesController.getOne);
router.post('/truee', ratingTablesController.getTrue);

module.exports = router;