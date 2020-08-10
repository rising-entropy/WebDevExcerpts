const bodyParser = require('body-parser');
const express = require('express');

const app = express();

app.get("/", (req, res)=>{
    var today = new Date();
    var pierre = today.getDay();
    if(pierre == 6 || pierre == 0)
    res.send("Fuck Yeah! There's a Weekend");
    else
    res.send("Fuck My Life.");
});

app.listen(3000, ()=>{
    console.log("Server Started.")
})
