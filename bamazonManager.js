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
                "View Products for Sale",
                "View Low Inventory",
                "Add to Inventory",
                "Add New Product"
            ]
        })
        .then(function (answer) {
            switch (answer.action) {
                case "View Products for Sale":
                    viewProductsForSale();
                    break;

                case "View Low Inventory":
                    viewLowInventory();
                    break;

                case "Add to Inventory":
                    addToInventory();
                    break;

                case "Add New Product":
                    newProduct();
                    break;
            }
        })
}

function viewProductsForSale() {
    var query = "SELECT * FROM bamazon.products_for_sale;";
    connection.query(query, function (err, res) {
        if (err) {
            console.log("Error transaction incomplete!" + err);
        } else {
            res.forEach(element => {
                console.log(
                    "\nItem Id: " +
                    element.item_id +
                    "\t|  Product: " +
                    element.product_name +
                    "\t|  Price: " +
                    element.price + "\n"
                );
            });
            userOptions();
        }
    });
}

function viewLowInventory() {
    var query = "SELECT * FROM bamazon.low_inventory;";
    connection.query(query, function (err, res) {
        if (err) {
            console.log("Error transaction incomplete!" + err);
        } else {
            res.forEach(element => {
                console.log(
                    "\nItem Id: " +
                    element.item_id +
                    "\t|  Product: " +
                    element.product_name +
                    "\t|  Price: " +
                    element.price +
                    "\t|  Quantity: " +
                    element.quantity +
                    "\t|  Departament: " +
                    element.departament + "\n"
                );
            });
            userOptions();
        }
    });
}

function addToInventory() {
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
            var query = "CALL add_to_inventory(?, ?)";
            connection.query(query, [answer.product_id, answer.quantity], function (err, res) {
                if (err) {
                    console.log("Error transaction incomplete!");
                } else {
                    console.log("\nSuccessfully added to inventory!.\n");
                    userOptions();
                }
            });
        });
}


function newProduct() {
    inquirer
        .prompt([{
            name: "product_name",
            type: "input",
            message: "Please type the product name: "
        },
        {
            name: "price",
            type: "input",
            message: "Please type the price: "
        },
        {
            name: "quantity",
            type: "input",
            message: "Please type the quantity: "
        },
        {
            name: "departament_id",
            type: "input",
            message: "Please type the departament id: "
        }])
        .then(function (answer) {
            var query = "CALL add_new_product(?, ?, ?, ?)";
            connection.query(query, [answer.product_name, answer.price, answer.quantity, answer.departament_id], function (err, res) {
                if (err) {
                    console.log("Error transaction incomplete!");
                } else {
                    console.log("\nSuccessfully added new product!\n");
                    userOptions();
                }
            });
        });
}

userOptions();