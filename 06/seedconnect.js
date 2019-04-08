//require mysql npm package
let mysql = require('mysql');
//create connection to mysql database
let connection = mysql.createConnection({
    //host, port, user, password, database
    host: "localhost",
    port: 3000,
    user: "root",
    password: "",
    database: "tea_db"
});
//connect to mysql database
connection.connect(function (error) {
    if (error) throw error;
    //log the threadId if error
    console.log('connected as id ' + connection.threadId);
    // end connection if error
    connection.end();
})