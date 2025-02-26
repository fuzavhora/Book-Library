const router = require("express").Router();
const userController = require("./user.controller");
const { userAuth, cartAuth } = require("../utils/authentication");

router.post("/create", async (req, res) => {
  const model = await userController.create(req.body);
  res.status(model.status).send(model.data);
});

router.post("/addtocart", cartAuth(), async (req, res) => {
  const model = await userController.addtocart(req.body, req.headers);
  res.status(model.status).send(model.data);
});

router.get("/cart", userAuth(), async (req, res) => {
  const model = await userController.getCart(req.headers);
  res.status(model.status).send(model.data);
});

module.exports = router;
