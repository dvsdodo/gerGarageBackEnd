const jwt = require("jsonwebtoken");
const { promisify } = require("util");

module.exports = {
    eAdmin: async function (req, res, next){
        const authHeader = req.headers.authorization;
        //console.log(authHeader);
        if (!authHeader) {
            return res.status(400).json({
                error: true,
                mensage: "Error: You need Login! Token A"
            });
        }

        const [, token]= authHeader.split(" ");
        console.log("Token: " + token);

        if (!token) {
            return res.status(400).json({
                error: true,
                mensage: "Error: You need Login! Token B"
            });
        }

        try {
            const decode = await promisify(jwt.verify)(token, "D10F17F03M09L11J07A05");
            req.userId = decode.id_user;
            return next();
        } catch (err) {
            return res.status(400).json({
                error: true,
                mensage: "Error: You need Login! Token Invalid"
            });
        }

    }
}