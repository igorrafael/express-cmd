var express = require("express");
var app = express();

app.get("/", function (req, res) {
  res.send("Hello World!");
});

app.use("/cmd", require("./lib"));

var port = 3030;
app.listen(port, function () {
  console.log("Test server listening on port "+port);
});
