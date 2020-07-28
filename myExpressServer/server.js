
const express = require('express');
const { response } = require('express');
const app = express();

app.listen(3000, () => {
    console.log("Server Started.")
})

app.get("/", (req, res)=>{
    res.send("<h1>She said do you Love Me?</h1>")
})

app.get("/contact", (req, res)=>{
    res.send("Don't Contact Me.");
})

app.get("/about", (req, res)=>{
    res.send("I am Depressed.");
})

app.get("/hobbies", (req, res)=>{
    res.send("Reading, Football, Code.");
})