const jwt = require("jsonwebtoken");

async function login(email) {

return jwt.sign(
{
email
},
process.env.JWT_SECRET,
{
expiresIn: "1d"
}
);

}

module.exports = {
login
};
