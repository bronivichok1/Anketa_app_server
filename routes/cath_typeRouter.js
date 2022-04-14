const Router = require('express');
const router = new Router;
const cath_typeController= require('../controllers/cath_typeController');
const checkRole = require('../middleware/checkRoleMiddleware');

router.post('/', cath_typeController.create);
router.get('/', cath_typeController.get);
router.delete('/:id', cath_typeController.delete);
router.put('/:id', cath_typeController.update);
router.get('/:id', cath_typeController.getOne);

module.exports = router;