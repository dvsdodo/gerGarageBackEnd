const Sequelize = require("sequelize");
const db = require("./db");

const EngineType = db.define("engine_types", {
    id_engine_type: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
    },
    engine_name: {
        type: Sequelize.STRING,
        allowNull: false,
    }
});

module.exports = EngineType;