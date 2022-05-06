const Router = require('express');
const router = new Router;
const cathResultController = require('../controllers/cathResultController');

router.post('/', cathResultController.create);
router.get('/', cathResultController.get);
router.delete('/:id', cathResultController.delete);
router.put('/:id', cathResultController.update);
router.get('/:id', cathResultController.getOne);
router.get('/own/:id', cathResultController.getOneOwn);
router.get('/active/:id', cathResultController.getResActive);

module.exports = router;