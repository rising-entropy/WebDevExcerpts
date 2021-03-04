const express = require('express');
const bodyParser = require('body-parser');
const app = express();

app.use(bodyParser.urlencoded({extended: true}));

app.set('view engine', 'ejs');

app.listen(3000, ()=>{
    console.log("Server Started.");
});

app.use(express.static('public'));

var tasks = ["Add First Task"];

app.get("/", (req, res)=>{
    var today = new Date();
    var options = {weekday: 'long', month: 'long', year: 'numeric', day: 'numeric'};
    var date = today.toLocaleDateString('en-GB', options);
    res.render(__dirname + '/views/list', {Date: date, tasks: tasks});
});

app.post("/", (req, res)=>{
    var task = req.body.task;
    tasks.push(task);
    res.redirect("/");
});

app.get("/about", (req, res)=>{
    res.render("about");
})
