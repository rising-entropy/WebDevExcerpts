//import the module
const path = require('path');

//Get Base Name
console.log(path.basename(__filename));

//Get File Directory
console.log(path.dirname(__filename));

//Get File Extension
console.log(path.extname(__filename));

//Get all details as Object
console.log(path.parse(__filename));