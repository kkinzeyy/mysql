//require 'mysql'
let mysql = require('mysql');
//create connection
let connection = mysql.createConnection({
    //host, port, user, password, database
    host: 'localhost',
    port: 3000,
    user: 'root',
    password: '',
    database: 'songs_db'
});
// connect to db
connection.connect(function (error) {
    if (error) throw error;
    //log connection.threadId
    console.log('connection id: ' + connection.threadId);
    searchAll();
    searchCover();
});

// function to search all songs
function searchAll() {
    connection.query('SELECT * FROM songs', function (error, res) {
        for (let i = 0; i < res.length; i++;) {
        console.log(res[i].id + '-' + res[i].title + '-' + res[i].artist + '-' + res[i].genre)
    }
});
}

// function to search for cover songs
function searchCover() {
    connection.query('SELECT * FROM songs WHERE genre=?', ['cover'], function (error, res) {
        for (let i = 0; i < res.length; i++) {
            console.log(res[i].id + '-' + res[i].title + '-' + res[i].artist + '-' + res[i].genre)
        }
    });

    //log query run
    console.log(query.sql);
}