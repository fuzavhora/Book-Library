const router = require("express").Router();
const userController = require("./user.controller");
const { userAuth } = require("../utils/authentication");

router.post("/create", async (req, res) => {
  const model = await userController.create(req.body);
  res.status(model.status).send(model.data);
});

// router.get("/getUser", async (req, res) => {
//   const model = await userController.getUser(req.query);
//   res.status(model.status).send(model.data);
// });

router.post("/update", userAuth(), async (req, res) => {
  const model = await userController.updateUser(req.body, req.headers);
  res.status(model.status).send(model.data);
});

module.exports = router;
