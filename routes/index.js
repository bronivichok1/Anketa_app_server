const Router = require('express');
const router = new Router;
const userRouter = require('./userRouter');
const itemRouter = require('./itemRouter');
const reportRouter = require('./reportRouter');
const resultRouter = require('./resultRouter');
const select_nameRouter = require('./select_nameRouter');
const cathedraRouter = require('./cathedraRouter');
const massivRouter = require('./massivRouter');


router.use('/user', userRouter);
router.use('/item', itemRouter);
router.use('/report', reportRouter);
router.use('/result', resultRouter);
router.use('/select_name', select_nameRouter);
router.use('/cathedra', cathedraRouter);
router.use('/massiv', massivRouter);


module.exports = router;