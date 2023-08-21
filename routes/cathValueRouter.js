const Router = require('express');
const router = new Router;
const cathValueController= require('../controllers/cathValueController');

router.post('/', cathValueController.create);
router.get('/', cathValueController.get);
router.delete('/:id', cathValueController.delete);
router.put('/:id', cathValueController.update);
router.get('/:id', cathValueController.getOne);

module.exports = router;