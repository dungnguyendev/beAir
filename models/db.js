var mysql = require("mysql");
var db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DBNAME,
});
db.connect(() => console.log("Da ket noi database !"));
module.exports = db;
