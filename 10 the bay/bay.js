//require mysql and inquirer

let mysql = require('mysql');
let inquirer = require('inquirer');

//create connection to db
let connection = mysql.createConnection({
    //host, port, user, password, database
    host: 'localhost',
    port: 3000,
    user: 'root',
    password: '',
    database: 'bay_db'
});

// connect to db
connection.connect(function (error) {
    if (error) throw error;
    //call start() after connection is successful
    start();
})

//set up start()
function start() {
    inquirer
        .prompt({
            name: 'postORbid',
            type: 'list',
            message: 'do you want to [POST] an item for sale or [BID] on an item? or [EXIT]...',
            choices: ['POST', 'BID', 'EXIT']
        })
        .then(function (answer) {
            if (answer.postORbid === 'BID') {
                bid();
            }
            else if (answer.postORbid === 'POST') {
                post();
            }
            else {
                connection.end();
            }
        });
}

//function to POST aution
function post(); {
    //use inquierer to get input from user
    inquirer.prompt([{
        name: 'category',
        type: 'input',
        message: 'what category does this item fall under?'
    }, {
        name: 'item',
        type: 'input',
        message: 'what is the name of the item you are listing?'
    },
    {
        name: 'startBid',
        type: 'input',
        message: 'how much do you want the bidding to start at?',
        validate: function (value) {
            if (isNaN(value) === false) {
                return true;
            }
        }
    }])
        .then(function (answer) {
            //after answer is validated information is inserted into db
            connection.query('INSERT INTO auctions SET ?', {
                item_name: answer.item,
                category: answer.category,
                startBid: answer.startBid || 0,
                highBid: answer.startBid || 0
            },
                function (error) {
                    if (error) throw error;
                    console.log('You created an aution!');
                    //start() again
                    start();
                });
        });
}
//set up bid function
function bid() {
    //query db with *
    connection.query('SELECT * FROM autions', function (err, res) {
        if (err) throw err;
        console.log(err);
        //prompt user for bid
        inquirer
            .prompt([{
                name: 'selection',
                type: 'list',
                choices: function () {
                    let choices = [];
                    for (let i = 0; i < res.length; i++) {
                        choices.push(res[i].item_name);
                    }
                    return choices;
                },
                message: 'which item would you like to bid on?'
            }, {
                name: 'bid',
                type: 'input',
                message: 'how much are you bidding on this item?'
            }
            ])
            .then(function (answer) {
                //return information on item chosen
                let selectedItem;
                for (let i = 0; i < res.length; i++) {
                    if (res[i].item_name === answer.choice) {
                        selectedItem = res[i];
                    }
                }
                //check to see if the bid was high enough
                if (selectedItem.highBid < parseInt(answer.bid)) {
                    //if bid is higher than current update db
                    connection.query(
                        'UPDATE autions SET ? WHERE ?',
                        [{
                            highBid: answer.bid
                        }, {
                            id: selectedItem.id
                        }],
                        function (err) {
                            if (err) throw err;
                            console.log('you put a bid on this item!');
                            //call start() to start again
                            start();
                        }
                    );
                }
                else {
                    //bid wasn't higher than current
                    console.log('your bid wasnt high enough');
                    //call start()
                    start;
                }
            });
    });
}