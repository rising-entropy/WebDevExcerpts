//jshint esversion: 6
const express = require('express');
const app = express();

const bodyParser = require('body-parser');

app.use(bodyParser.json());

app.listen(3000, ()=>{
    console.log("Server Started.");
});


