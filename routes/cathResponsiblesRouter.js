const Router = require('express');
const router = new Router;
const cathResponsiblesController = require('../controllers/cathResponsiblesController');

router.post('/', cathResponsiblesController.create);
router.get('/', cathResponsiblesController.get);
router.delete('/:id', cathResponsiblesController.delete);
router.put('/:id', cathResponsiblesController.update);
router.get('/:id', cathResponsiblesController.getOne);

module.exports = router;