//require 'mysql'
let mysql = require('mysql');
//create connection
let connection = mysql.createConnection({
    //host, port, user, password, database
    host: 'localhost',
    port: 3000,
    user: 'root',
    password: '',
    database: 'tea_db'
});
// connect to db
connection.connect(function (error) {
    if (error) throw error;
    //log connection.threadId
    console.log('connection id: ' + connection.threadId);
    afterConnect();
});
// function for succesful connection
function afterConnect() {
    // select flavors from the db
    connection.query('SELECT * FROM flavors', function (error, response) {
        if (error) throw error;
        console.log(response);
        connection.end()
    });
}