const router = require("express").Router();
const profileController = require("./profile.controller");
const { userAuth } = require("../utils/authentication");

router.post("/login", async (req, res) => {
  const model = await profileController.login(req.body);
  res.status(model.status).send(model.data);
});

router.delete("/delete", userAuth(), async (req, res) => {
  const model = await profileController.deleteUser(req.headers);
  res.status(model.status).send(model.data);
});

module.exports = router;
