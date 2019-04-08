//require mysql
let mysql = require('mysql');
//create connection
let connection = mysql.createConnection({
    //host,port,user,password,database
    host: 'localhost',
    port: 3000,
    password: '',
    database: 'tea_db'
});

//connect to database
connection.connect(function (error) {
    if (error) throw error;
    //log threadId
    console.log('connection id: ' + connection.threadId + '\n');
    createFlavor();
});

//function to create flavor
function createFlavor() {
    console.log('CREATING A NEW FLAVOR \N');
    //set up a query
    let query = connection.query(
        'INSERT INTO flavors SET ?',
        { flavor: 'mango-strawberry', price: 2.50, quantity: 250 },
        function (error, res) {
            console.log(res.affectedRows + ' flavor created and input! \n');
            // call update after create() completes
            updateFlavor();
        }
    );
    //log the query
    console.log(query.sql)
}

//function to update flavor
function updateFlavor() {
    console.log('updating the green tea flavor qtys \n');
    let query = connection.query(
        'UPDATE products SET ? WHERE ?',
        [{
            quantity: 100
        },
        {
            flavor: 'green'
        }],
        function (error, res) {
            console.log(res.affectedRows + 'quantities updated!\n');
            //call delete after update() completes
            deleteFlavor();
        }
    )
    //log the query
    console.log(query.sql)
}

//function to delete a flavor
function deleteFlavor() {
    console.log('DELETING ALL THE MANGO-STRAWBERRY INVENTORY? \N');
    connection.query(
        'DELETE FROM flavors WHERE ?',
        {
            flavor: 'mango-strawberry'
        },
        function (error, res) {
            console.log(res.affectedRows + ' all of the inventory was deleted! \n');
            //call read after delete() completes
            readFlavors();
        }
    )
    //log the query
    console.log(query.sql)
}

function readFlavors() {
    console.log('viewing all flavors \n');
    connection.query('SELECT * FROM flavors', function (err, res) {
        if (err) throw err;
        console.log(res);
        //end connection after read() completes
        connection.end();
    });
}
