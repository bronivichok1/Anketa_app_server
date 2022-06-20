const Router = require('express');
const router = new Router;
const bookReportController = require('../controllers/bookReportController');
const checkRole = require('../middleware/checkRoleMiddleware');

router.post('/', bookReportController.create);
router.get('/', bookReportController.get);
router.delete('/:id', bookReportController.delete);
router.get('/:id', bookReportController.getOne);
router.get('/byCath/:id', bookReportController.getByCath);
router.post('/create', bookReportController.createReport);

module.exports = router;