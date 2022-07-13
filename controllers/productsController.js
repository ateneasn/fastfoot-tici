const db = require('../database/models')

module.exports = {
    list: (req,res) => {
        db.Producto.findAll().then((products)=>{
            res.render("products.ejs",{products})
        })   
    },
    details: (req,res) => {
        db.Producto.findByPk(req.params.id).then((producto)=>{
            res.render('products-details.ejs',{producto})
        })
        
    },
    index: (req,res) => {
        res.render('index.ejs')
    },
    createForm:(req,res) => {
        res.render('products-create.ejs')
    },
    editForm:(req,res) => {
        db.Producto.findByPk()
        .then(products=>{
            res.render("products-edit.ejs",{products})
        })
    },  
    create: (req,res) => {
        db.Producto.create({
            nombre:req.body.nombre,
            ingredientes:req.body.ingredientes,
            precio:req.body.precio,
            imagen:req.file.filename,

        })
    res.redirect("/")
    },

}
