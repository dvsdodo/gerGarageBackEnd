const Sequelize = require("sequelize");
const db = require("./db");

const BookingService = db.define("booking_services", {
    id_booking_service: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
    },
    booking_service_name: {
        type: Sequelize.STRING,
        allowNull: false,
    },
    booking_service_cost: {
        type: Sequelize.DOUBLE,
        allowNull: false,
    }
});

module.exports = BookingService;