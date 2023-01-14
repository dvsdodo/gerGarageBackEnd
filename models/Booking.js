const Sequelize = require("sequelize");
const db = require("./db");
const Staff = require("./Staffs");
const Status = require("./Status");
const Vehicle = require("./Vehicle");

const Booking = db.define("bookings", {
    id_booking: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
    },
    id_vehicle: {
        type: Sequelize.INTEGER,
        allowNull: false,
    },
    id_status: {
        type: Sequelize.INTEGER,
        allowNull: false,
    },
    id_staff: {
        type: Sequelize.INTEGER,
        allowNull: true,
    },
    date: {
        type: Sequelize.DATEONLY,
        allowNull: false,
    },
    id_booking_service: {
        type: Sequelize.INTEGER,
        allowNull: false,
    },
    id_slots: {
        type: Sequelize.INTEGER,
        allowNull: false,
    }
});

Booking.hasOne(Vehicle, { foreignKey: "id_vehicle"});
Booking.hasOne(Status, { foreignKey: "id_status"});
Booking.hasOne(Staff, { foreignKey: "id_staff"});

module.exports = Booking;