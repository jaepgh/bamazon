var mysql = require("mysql");
var inquirer = require("inquirer");
var shoppingCar = [];

var connection = mysql.createConnection({
    host: "localhost",

    // Your port; if not 3306
    port: 3306,

    // Your username
    user: "root",

    // Password
    password: 'root',
    database: "bamazon"
});

function userOptions() {
    inquirer
        .prompt({
            name: "action",
            type: "rawlist",
            message: "What would you like to do?",
            choices: [
                "Add to my shopping car",
                "Go to checkout",
                "List of products",
                "Exit"
            ]
        })
        .then(function (answer) {
            switch (answer.action) {
                case "Add to my shopping car":
                    addShoppingCar();
                    break;

                case "Go to checkout":
                    checkOut();
                    break;

                case "List of products":
                    listProducts();
                    break;

                case "Exit":
                    connection.end();
                    break;
            }
        })
}

function addShoppingCar() {
    inquirer
        .prompt([{
            name: "product_id",
            type: "input",
            message: "Please type the product Id: "
        },
        {
            name: "quantity",
            type: "input",
            message: "Please type the quantity: "
        }])
        .then(function (answer) {
            productAvaliable(answer.product_id, answer.quantity);
        });
}

function checkOut() {
    var query = "CALL products_sale(?, ?)";
    var currentDate = new Date();
    connection.query(query, [currentDate.getFullYear() + "-" + currentDate.getMonth() + "-" + currentDate.getDate(), 1], function (err, res) {
        if (err) {
            console.log("Error transaction incomplete!");
        } else {
            var insideQuery = "CALL buy_product(?, ?)";
            shoppingCar.forEach(element => {
                connection.query(insideQuery, [element.id, element.qty], function (err, res) {
                    if (err) {
                        console.log("Error transaction incomplete!" + err);
                    } else {
                        //Empty shopping car
                        shoppingCar = [];
                    }
                });
            });
            userOptions();
        }
    });
}

function listProducts() {
    var query = "SELECT * FROM bamazon.products_for_sale;";
    connection.query(query, function (err, res) {
        if (err) {
            console.log("Error transaction incomplete!" + err);
        } else {
            res.forEach(element => {
                console.log(
                    "Item Id: " +
                    element.item_id +
                    "\t|  Product: " +
                    element.product_name +
                    "\t|  Price: " +
                    element.price
                );
            });
            userOptions();
        }
    });
}

function productAvaliable(id, quantity) {
    var query = "SELECT * FROM products WHERE item_id = ? AND price > ?;";
    connection.query(query, [id, quantity], function (err, res) {
        if (err) {
            console.log("Error transaction incomplete!" + err);
        } else {
            if (res.length > 0) {
                shoppingCar.push({ id: res.product_id, qty: res.quantity });
            } else {
                console.log("\nInsufficient stock to fulfill the order!\nTry again!\n");
            }
            userOptions();
        }
    });
}

userOptions();