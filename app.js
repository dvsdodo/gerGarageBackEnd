const express = require("express");
const cors = require("cors");
const app = express();
const User = require("./models/User");

app.use(cors());
app.use(express.json());

app.post("/sessions", async (req, res) => {

    await User.findAll({ where: { username: req.body.username, password: req.body.password } }).then((result) => {
        return res.json(result);
    })
});

app.get("/listUsers", async (req, res) => {

    await User.findAll().then((result) => {
        return res.json(result)
    });
});

app.listen(5000, () => {
    console.log("service started on port 5000");
});