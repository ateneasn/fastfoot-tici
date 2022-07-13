var express = require("express");
var router = express.Router()
const db = require('../database/models')
const {validationResult}=require('express-validator')

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
        db.Producto.findByPk(req.params.id)
        .then(products=>{
            res.render("products-edit.ejs",{products})
        })
        .catch(error => res.send(error))
    },
    create: (req,res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
        return res.render("products-create.ejs", {
          errors: errors.errors,
          oldData: req.body
        });
        }
        let producto = db.Producto.create({
            nombre:req.body.nombre,
            ingredientes:req.body.ingredientes,
            precio:req.body.precio,
            imagen:req.file.filename,
        })
        res.render("products-details.ejs",{producto})
    },
    updateProduct: (req,res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
        return res.render("products-create.ejs", {
          errors: errors.errors,
          oldData: req.body
        });
        }
        let producto = db.Producto.update({
            nombre:req.body.nombre,
            ingredientes:req.body.ingredientes,
            precio:req.body.precio,
            imagen:req.file.filename,
            },{
                where:{
                    id:req.params.id
                }
            })
            res.redirect('/')
    },

    delete:(req, res) =>{
        db.Producto.destroy({
          where:{
            id:req.params.id
          }
        })
        res.redirect('/')
    },
}