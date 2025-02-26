const router = require("express").Router();
const paymentController = require("./payment.controller");
const { paymentAuth } = require("../utils/authentication");

router.post("/create-payment-intent", paymentAuth(), async (req, res) => {
  const model = await paymentController.createPaymentIntent(
    req.body,
    req.headers
  );
  res.status(model.status).json(model.data);
});

module.exports = router;
