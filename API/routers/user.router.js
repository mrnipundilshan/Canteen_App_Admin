const router = require('express').Router();
const UserController = require("../controller/user.controller");
const db = require('../config/db');

router.post('/register', UserController.register);

router.post('/login',UserController.login);

router.get('/getmenu',UserController.getmenu);

router.post('/placeorder',UserController.placeorder);

router.post('/getprodetails',UserController.getprodetails);

router.post('/getuserorders',UserController.getuserorders);


module.exports = router;