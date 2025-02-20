const router = require("express").Router();
const authController = require("./author.controller");
const { auth, bookExist } = require("../utils/authentication");

router.post("/create", async (req, res) => {
  const model = await authController.create(req.body);
  res.status(model.status).json(model.data);
});

// Book routes
router.post("/add-book", auth([2]), bookExist(), async (req, res) => {
  const model = await authController.addBook(req.body, req.headers);
  res.status(model.status).json(model.data);
});

module.exports = router;
