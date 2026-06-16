const router =
require("express")
.Router();

const auth =
require(
"../middleware/authMiddleware"
);

const authController =
require(
"../controllers/authController"
);

const dashboard =
require(
"../controllers/dashboardController"
);

const reports =
require(
"../controllers/reportController"
);

const analytics =
require(
"../controllers/analyticsController"
);

router.get(
"/health",
(
req,
res
)=>
res.json({
status:
"OK"
})
);

router.post(
"/login",
authController.login
);

router.get(
"/dashboard",
auth,
dashboard.dashboard
);

router.get(
"/reports",
auth,
reports.getReports
);

router.get(
"/analytics",
auth,
analytics.getAnalytics
);

module.exports =
router;
