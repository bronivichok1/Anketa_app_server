const Router = require('express');
const router = new Router;
const massivController = require('../controllers/massivController');

router.post('/', massivController.create);
router.get('/:id', massivController.get);
router.delete('/:id', massivController.delete);
router.put('/:id', massivController.update);

module.exports = router;