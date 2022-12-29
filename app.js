const express = require("express");
const cors = require("cors");
const app = express();
const User = require("./models/User");

const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

const { eAdmin } = require("./middlewares/auth");
const { where } = require("sequelize");

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

    if(!(await bcrypt.compare(req.body.password, user.password))){
        return res.status(400).json({
            error: true,
            mensage: "Error: Invalid User or Password! Password "
        });
    }

    var token = jwt.sign({id_user: user.id_user, name: user.name, password: user.password, username: user.username, phone_number: user.phone_number, is_admin: user.is_admin},
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

/*app.post("/createUser", async (req, res) => {

    await User.create({
        name: req.body.name,
        password: req.body.password,
        username: req.body.username,
        phone_number: req.body.phone_number,
        is_admin: req.body.is_admin === 0
    }).then((result) => res.json(result));
});*/

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
        return res.json({
            erro: false,
            mensagem: "Create a new user"
        });
    }).catch(() => {
        return res.status(400).json({
        erro: true,
        mensagem: "Error: Fail to Create a new user"
        });
    });

    
});

app.listen(5000, () => {
    console.log("service started on port 5000");
});