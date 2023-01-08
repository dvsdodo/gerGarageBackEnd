const Sequelize = require("sequelize");
const db = require("./db");

const Slots = db.define("slots", {
    id_slots: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
    },
    slots_name: {
        type: Sequelize.STRING,
        allowNull: false,
    }
});

module.exports = Slots;