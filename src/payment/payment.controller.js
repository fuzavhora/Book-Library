const paymentService = require("./payment.service");

const createPaymentIntent = async (data, header) => {
  return await paymentService.createPaymentIntent(data, header);
};

module.exports = { createPaymentIntent };
