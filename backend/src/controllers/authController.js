const authService =
require("../services/authService");

exports.login =
async (
req,
res
)=>{

try{

const {
email
}=req.body;

if(!email){

return res
.status(400)
.json({
message:
"Email required"
});

}

const token =
await authService.login(
email
);

res.json({
token
});

}

catch(err){

res
.status(500)
.json({
error:
err.message
});

}

};
