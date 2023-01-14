const express = require("express");
const cors = require("cors");
const app = express();
const User = require("./models/User");

const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

const { eAdmin } = require("./middlewares/auth");
const { where } = require("sequelize");
const Type = require("./models/Type");
const EngineType = require("./models/EngineType");
const Make = require("./models/Make");
const Vehicle = require("./models/Vehicle");

const Status = require("./models/Status");
const Staff = require("./models/Staffs");
const BookingService = require("./models/BookingService");
const Booking = require("./models/Booking");
const Slots = require("./models/Slots");

app.use(cors());
app.use(express.json());

/*app.post("/sessions", async (req, res) => {

    await User.findAll({ where: { username: req.body.username, password: req.body.password } }).then((result) => {
        return res.json(result);
    })
});*/

app.post("/sessions", async (req, res) => {
    console.log(req.body);

    const user = await User.findOne({
        attributes: ["id_user", "name", "password", "username", "phone_number", "is_admin"],
        where: {
            username: req.body.username
        }
    });

    if (user === null) {
        return res.status(400).json({
            error: true,
            mensage: "Error: Invalid User or Password! Username "
        });
    };

    if (!(await bcrypt.compare(req.body.password, user.password))) {
        return res.status(400).json({
            error: true,
            mensage: "Error: Invalid User or Password! Password "
        });
    }

    var token = jwt.sign({ id_user: user.id_user, name: user.name, password: user.password, username: user.username, phone_number: user.phone_number, is_admin: user.is_admin },
        "D10F17F03M09L11J07A05", {
        expiresIn: "7d"
    });

    return res.json({
        error: false,
        mensage: "Login",
        user,
        token
    });
});

app.get("/listUsers", eAdmin, async (req, res) => {

    await User.findAll().then((result) => {
        return res.json({
            erro: false,
            result
        })
    }).catch(() => {
        return res.status(400).json({
            erro: true,
            mensagem: "Error: No users found"
        });
    });
});

app.get("/listTest", eAdmin, async (req, res) => {

    await Booking.findAll({ 
        include: [{model: Staff}]
    }).then((result) => {
        return res.json({
            erro: false,
            result
        })
    }).catch(() => {
        return res.status(400).json({
            erro: true,
            mensagem: "Error: No Test found"
        });
    });
});

app.get("/listType", eAdmin, async (req, res) => {

    await Type.findAll().then((result) => {
        return res.json({
            erro: false,
            result
        })
    }).catch(() => {
        return res.status(400).json({
            erro: true,
            mensagem: "Error: No users found"
        });
    });
});

app.get("/listEngineType", eAdmin, async (req, res) => {

    await EngineType.findAll().then((result) => {
        return res.json({
            erro: false,
            result
        })
    }).catch(() => {
        return res.status(400).json({
            erro: true,
            mensagem: "Error: No Engine found"
        });
    });
});

app.get("/listMake", eAdmin, async (req, res) => {

    await Make.findAll().then((result) => {
        return res.json({
            erro: false,
            result
        })
    }).catch(() => {
        return res.status(400).json({
            erro: true,
            mensagem: "Error: No Make found"
        });
    });
});

app.get("/listStatus", eAdmin, async (req, res) => {

    await Status.findAll().then((result) => {
        return res.json({
            erro: false,
            result
        })
    }).catch(() => {
        return res.status(400).json({
            erro: true,
            mensagem: "Error: No Status found"
        });
    });
});

app.get("/listStaff", async (req, res) => {

    await Staff.findAll().then((result) => {
        return res.json({
            erro: false,
            result
        })
    }).catch(() => {
        return res.status(400).json({
            erro: true,
            mensagem: "Error: No Staff found"
        });
    });
});

app.get("/listBooking", async (req, res) => {

    await Booking.findAll().then((result) => {
        return res.json({
            erro: false,
            result
        })
    }).catch(() => {
        return res.status(400).json({
            erro: true,
            mensagem: "Error: No Booking found"
        });
    });
});

app.get("/listBookingService", eAdmin, async (req, res) => {

    await BookingService.findAll().then((result) => {
        return res.json({
            erro: false,
            result
        })
    }).catch(() => {
        return res.status(400).json({
            erro: true,
            mensagem: "Error: No Booking Service found"
        });
    });
});

app.get("/listVehicle", eAdmin, async (req, res) => {

    await Vehicle.findAll().then((result) => {
        return res.json({
            erro: false,
            result
        })
    }).catch(() => {
        return res.status(400).json({
            erro: true,
            mensagem: "Error: No Vehicle found"
        });
    });
});

app.get("/listSlots", eAdmin, async (req, res) => {

    await Slots.findAll().then((result) => {
        return res.json({
            erro: false,
            result
        })
    }).catch(() => {
        return res.status(400).json({
            erro: true,
            mensagem: "Error: No Slots found"
        });
    });
});

app.post("/createUser", async (req, res) => {
    //console.log(req.body);
    var data = req.body;
    data.password = await bcrypt.hash(data.password, 8);
    data.is_admin === 0;

    console.log(data);

    await User.create({
        name: req.body.name,
        password: req.body.password,
        username: req.body.username,
        phone_number: req.body.phone_number,
        is_admin: req.body.is_admin === 0
    })
        .then(() => {
            return res.json(data);
        }).catch(() => {
            return res.status(400).json({
                erro: true,
                mensagem: "Error: Fail to Create a new user"
            });
        });
});

app.post("/createVehicle", async (req, res) => {
    //console.log(req.body);
    var data = req.body;

    console.log(data.id_user);
    //para corrigir o erro que estava dando ao inviar os dados a serem gravados no banco eu tive que acrescentar esse "id_user na frente do data"
    await Vehicle.create(data.id_user)
        .then(() => {
            return res.json(data.id_user);
        }).catch(() => {
            return res.status(400).json({
                erro: true,
                mensagem: "Error: Fail to Create a new Vehicle"
            });
        });

});

app.post("/createBooking", async (req, res) => {
    var data = req.body.id_vehicle;
    await data.id_status === 1;
    console.log(data);

    await Booking.create({
        id_vehicle: data.id_vehicle,
        date: data.date,
        id_booking_service: data.id_booking_service,
        id_slots: data.id_slots,
        id_status: data.id_status === 1
    })
    .then(() =>{
        return res.json(data);
    }).catch(() => {
        return res.status(400).json({
            erro: true,
            mensagem: "Error: Fail to Book",
            body: req.body.id_status
        });
    });
});

app.put("/createBooking/:id", async (req, res) => {
    const { id_staff } = req.body;
    const id = parseInt(req.params.id)
    //console.log(id_staff);
    console.log(typeof req.params.id);

    await Booking.update(
        { id_staff },
        {
            where: { id_booking : id},
        }
    ).then(() =>{
        return res.json(id_staff);
    }).catch(() => {
        return res.status(400).json({
            erro: true,
            mensagem: "Error: Fail to Book",
            body: req.body.id_staff
        });
    });
})

app.listen(5000, () => {
    console.log("service started on port 5000");
});