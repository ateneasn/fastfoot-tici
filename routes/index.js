var express = require('express');
var router = express.Router();
var productosController = require('../controllers/productsController');
var multer = require("../midllewares/multer")

/* GET home page. */
router.get('/', productosController.index);

router.get('/products', productosController.list);
router.get('/products/:id', productosController.details);

router.get('/products/create', productosController.createForm);
router.post('/products/create', multer.single("imagen"), productosController.create);

router.get('/products/edit/:id', productosController.editForm);

module.exports = router;
