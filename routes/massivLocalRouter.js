const Router = require('express');
const router = new Router;
const massivLocalController = require('../controllers/massivLocalController');

router.post('/', massivLocalController.create);
router.get('/:id', massivLocalController.get);
router.delete('/:id', massivLocalController.delete);
router.put('/:id', massivLocalController.update);
router.delete('/own/:id', massivLocalController.ownDelete);

module.exports = router;