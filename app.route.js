const express = require("express");
const router = express.Router();

const userRoute = require("./src/user/user.route");
const profileRoute = require("./src/profile/profile.route");
const authorRoute = require("./src/author/author.route");
const bookRoute = require("./src/Book/booke.route");
const adminRoute = require("./src/admin/admin.route");

// const authoRoute = require("./src/author/author.route");

router.use("/user", userRoute);
router.use("/profile", profileRoute);
router.use("/author", authorRoute);
router.use("/book", bookRoute);
router.use("/admin", adminRoute);

module.exports = router;
