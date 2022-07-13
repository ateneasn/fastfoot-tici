module.exports = (sequelize, dataTypes) => {
    let alias = 'Producto';
    let cols = {
        id:{
            type: dataTypes.BIGINT(10),
            primaryKey: true,
            autoIncrement: true,
        },
        nombre:{
            type: dataTypes.STRING
        },
        precio:{
            type: dataTypes.INTEGER
        },
        ingredientes:{
            type: dataTypes.TEXT
        },
        imagen:{
            type: dataTypes.STRING
        },
    };
    let config = {
        tableName : 'productos',
        timestamps : false,
    }
    const Producto = sequelize.define(alias, cols, config);

    return Producto;
};