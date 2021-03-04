//jshint esversion: 6

const express = require('express');
const app = express();

const bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({extended: true}));

app.listen(5000, ()=>{
    console.log("Server Started.");
})

app.get("/", (req, res)=>{
    res.sendFile(__dirname+"/bmi.html");
});

app.post("/", (req, res)=>{
    console.log(req.body);
    //res.send("On it");
    var weight = Number(req.body.weight);
    var height = Number(req.body.height);
    height = height/100;
    var bmi = weight/(height*height);
    bmi = parseFloat(bmi);
    if(bmi>30)
    res.send("Your BMI is "+bmi+" You are Obese.");
    else if(bmi>25)
    res.send("Your BMI is "+bmi+" You are Overweight.");
    else if(bmi>18.5)
    res.send("Your BMI is "+bmi+" You are Normal.");
    else
    res.send("Your BMI is "+bmi+" You are Underweight.");
});