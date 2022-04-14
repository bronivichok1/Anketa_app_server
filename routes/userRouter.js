const Router = require('express');
const router = new Router;
const userController = require('../controllers/userController');
const authMiddleware = require('../middleware/authMiddleware');

router.post('/login', userController.login);
router.get('/auth', authMiddleware, userController.check);
router.put('/:id', userController.update);
router.get('/:id', userController.getOne);
router.get('/find/:id', userController.find);
router.get('/', userController.findAdmins);

module.exports = router;