const Sequelize = require("sequelize");

const sequelize = new Sequelize("garagedb", "root", "Dvsdodo10", {
    host: "localhost",
    dialect: "mysql",
    define: {
        timestamps: false
    }
});

sequelize.authenticate()
.then(function(){
    console.log("Successful Connection");
}).catch(function(){
    console.log("Connection Error");
});

module.exports = sequelize;