const Sequelize = require("sequelize");
const db = require("./db");

const Vehicle = db.define("vehicles", {
    id_vehicle: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
    },
    id_user: {
        type: Sequelize.INTEGER,
        allowNull: false,
    },
    id_make: {
        type: Sequelize.INTEGER,
        allowNull: false,
    },
    id_engine_type: {
        type: Sequelize.INTEGER,
        allowNull: false,
    },
    vehicle_comment: {
        type: Sequelize.STRING,
    },
    vehicle_licence: {
        type: Sequelize.STRING,
        allowNull: false,
    }
});

module.exports = Vehicle;