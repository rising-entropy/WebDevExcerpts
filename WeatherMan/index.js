//jshint esversion: 6

const express = require('express');
const app = express();

const https = require('https');

app.listen(3000, ()=>{
    console.log("Server Started.");
});

app.get('/', (req, response)=>{
    //response.send("<h1>Hello There.</h1>");
    const url = "https://api.openweathermap.org/data/2.5/weather?q=pune&appid=4fc57c093b1962e1f5db11a8b893119c&units=metric#";
    https.get(url, (res)=>{
        //console.log(res.statusCode);
        res.on("data", (data)=>{
            const weather = JSON.parse(data);
            const temperature = weather.main.temp;
            const icon = weather.weather[0].icon;
            const describe = weather.weather[0].description;
            var s = "";
            s += "<h1>The temperature in Pune is: "+temperature+" degrees Celcius.</h1>";
            s += "<br><h3>The Weather is "+describe+".</h3>";
            s += "<br><br><img src='http://openweathermap.org/img/wn/"+icon+"@2x.png'>";
            response.send(s);    
        });
    });
});

