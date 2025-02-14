const router = require("express").Router();
const bookController = require("./book.controller");

router.get("/getBook", async (req, res) => {
  const model = await bookController.getBook(req.query, req.body);
  res.status(model.status).send(model.data);
});

module.exports = router;
