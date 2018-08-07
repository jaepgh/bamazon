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
                "View Products sales per Department",
                "Create department",
                "Exit"
            ]
        })
        .then(function (answer) {
            switch (answer.action) {
                case "View Products sales per Department":
                    viewSalesByDep();
                    break;

                case "Create department":
                    addToInventory();
                    break;

                case "Exit":
                    connection.end();
                    break;
            }
        })
}

function viewSalesByDep() {
    var query = "SELECT * FROM bamazon.product_sales_departament;";
    connection.query(query, function (err, res) {
        if (err) {
            console.log("Error transaction incomplete!" + err);
        } else {
            res.forEach(element => {
                console.log(
                    "\nDepartment Id: " +
                    element.department_id +
                    "\t|  Name: " +
                    element.department_name +
                    "\t|  Costs: " +
                    element.over_head_costs +
                    "\t|  Sales: " +
                    element.product_sales +
                    "\t|  Profit: " +
                    element.total_profit + "\n"
                );
            });
            userOptions();
        }
    });
}

function addToInventory() {
    inquirer
        .prompt([{
            name: "department",
            type: "input",
            message: "Please enter the department name: "
        }])
        .then(function (answer) {
            var query = "CALL new_department(?)";
            connection.query(query, [answer.department], function (err, res) {
                if (err) {
                    console.log("Error transaction incomplete!");
                } else {
                    console.log("\nSuccessfully added!.\n");
                    userOptions();
                }
            });
        });
}

userOptions();