const router = require("express").Router();
const adminController = require("./admin.controller");
const { adminAuth } = require("../utils/authentication");

router.get("/getUser", adminAuth([1]), async (req, res) => {
  const model = await adminController.getUser(req.query);
  res.status(model.status).send(model.data);
});

router.delete("/delete", adminAuth([1]), async (req, res) => {
  const model = await adminController.deleteUser(req.body);
  res.status(model.status).send(model.data);
});

module.exports = router;
