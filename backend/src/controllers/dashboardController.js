exports.dashboard =
(
req,
res
)=>{

res.json({

message:
"Dashboard loaded",

user:
req.user

});

};
