const Sequelize = require("sequelize");
const db = require("./db");

const User = db.define("users", {
    id_user: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
    },
    name: {
        type: Sequelize.STRING,
        allowNull: false,
    },
    password: {
        type: Sequelize.STRING,
        allowNull: false,
    },
    username: {
        type: Sequelize.STRING,
        allowNull: false,
    },
    is_admin: {
        type: Sequelize.STRING,
    }
});

module.exports = User;