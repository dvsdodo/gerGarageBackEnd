const Sequelize = require("sequelize");
const db = require("./db");

const Staff = db.define("staffs", {
    id_staff: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
    },
    staff_name: {
        type: Sequelize.STRING,
        allowNull: false,
    }
});

module.exports = Staff;