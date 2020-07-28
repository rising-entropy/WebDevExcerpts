//jshint esversion: 6

const express = require('express');
const app = express();

const bodyParser = require('body-parser');
const { urlencoded } = require('body-parser');

app.use(bodyParser.urlencoded({
    extended: true
  }));

app.listen(3000, ()=>{
    console.log("Server Started.");
});

app.get("/", (req, res)=>{
    res.sendFile(__dirname+"/index.html");
});

app.post("/", (req, res)=>{
    //res.send("I gotchu fam.");
    console.log(req.body);
    var a = Number(req.body.first);
    var b = Number(req.body.second);
    var result = a+b;
    res.send("The Sum is: "+result);
});


