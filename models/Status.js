const Sequelize = require("sequelize");
const db = require("./db");

const Status = db.define("statuses", {
    id_status: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
    },
    status_name: {
        type: Sequelize.STRING,
        allowNull: false,
    }
});

module.exports = Status;