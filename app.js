const express = require("express");
const appRoute = require("./app.route");

const app = express();

app.use(express.json());

app.use("/", appRoute);

app.listen(3000, () => {
  console.log("Server is running on 3000 port");
});
