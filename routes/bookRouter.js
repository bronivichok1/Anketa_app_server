const Router = require('express');
const router = new Router;
const booksController = require('../controllers/booksController');
const checkRole = require('../middleware/checkRoleMiddleware');

router.post('/', booksController.create);
router.get('/', booksController.get);
router.delete('/:id', booksController.delete);
router.put('/:id', booksController.update);
router.get('/:id', booksController.getOne);
router.get('/report/:id', booksController.getByReport);
router.delete('/report/:id', booksController.deleteByReport);

module.exports = router;