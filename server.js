var express = require("express");
var app = express();

app.get("/", function (req, res) {
  res.send("Hello World!");
});

app.use("/cmd", require("./lib"));

app.listen(3000, function () {
  console.log("Test server listening on port 3000!");
});
