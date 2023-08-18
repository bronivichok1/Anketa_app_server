const Router = require('express');
const router = new Router;
const userCathedrasController = require('../controllers/userCathedrasController');

router.put('/:id', userCathedrasController.update);
router.get('/:id', userCathedrasController.getAll);

module.exports = router;