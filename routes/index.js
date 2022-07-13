var express = require('express');
var router = express.Router();
var productosController = require('../controllers/productsController');
var multer = require("../midllewares/multer")
const productsValidator = require('../midllewares/products-validator')

/* GET home page. */
router.get('/', productosController.index);

router.get('/products', productosController.list);
router.get('/products/create',productosController.createForm );
router.get('/products/:id', productosController.details);

router.post('/products/new', multer.single("imagen"), productsValidator, productosController.create);

router.get('/products/edit/:id', productosController.editForm);
router.post('/products/update/:id', multer.single("imagen"), productsValidator, productosController.updateProduct);

router.post('/products/delete/:id', productosController.delete);
module.exports = router;
