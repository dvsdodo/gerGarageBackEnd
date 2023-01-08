const Sequelize = require("sequelize");
const db = require("./db");

const Make = db.define("makes", {
    id_make: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
    },
    make_name: {
        type: Sequelize.STRING,
        allowNull: false,
    },
    id_type_vehicle: {
        type: Sequelize.STRING,
        allowNull: false,
    }
});

module.exports = Make;