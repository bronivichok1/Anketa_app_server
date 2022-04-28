const Router = require('express');
const router = new Router;
const resultController = require('../controllers/resultController');

router.post('/', resultController.create);
router.get('/', resultController.get);
router.delete('/:id', resultController.delete);
router.put('/:id', resultController.update);
router.get('/:id', resultController.getOne);
router.get('/cath/:id', resultController.getByCath);

module.exports = router;