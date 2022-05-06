const Router = require('express');
const router = new Router;
const datesController= require('../controllers/datesController');
const checkRole = require('../middleware/checkRoleMiddleware');

router.post('/', datesController.create);
router.get('/', datesController.get);
router.delete('/:id', datesController.delete);
router.put('/:id', datesController.update);
router.get('/:id', datesController.getOne);

module.exports = router;