const {body}=require('express-validator')

const productsValidator=[
    body("nombre")
    .notEmpty()
    .withMessage("Colocar nombre de producto")
    .isLength({min:10})
    .withMessage("Colocar más de 10 caracteres"),

    /* body("descripción")
    .notEmpty()
    .withMessage("Colocar detalle de producto")
    .isLength({min:30})
    .withMessage("Colocar más de 10 caracteres"), */

    body("precio")
    .notEmpty()
    .withMessage("Colocar precio de producto"),

    body("ingredientes")
    .notEmpty()
    .withMessage("Aclarar los ingredientes")
    .isLength({min:5})
    .withMessage("Colocar más de 5 caracteres"),
]

module.exports=productsValidator