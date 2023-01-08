const Sequelize = require("sequelize");
const db = require("./db");

const Type = db.define("type_vehicles", {
    id_type_vehicle: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
    },
    type_name: {
        type: Sequelize.STRING,
        allowNull: false,
    }
});

module.exports = Type;