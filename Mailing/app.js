const express = require('express');
const bodyParser = require('body-parser');
const request = require('request');
const https = require('https');

const app = express();

app.use(express.static('public'));
app.use(bodyParser.urlencoded({
    extended: true
}));

app.listen(process.env.PORT || 5000, () => {
    console.log("Server Started.");
});

app.get('/', (req, res) => {
    res.sendFile(__dirname + "/index.html");
});

app.post('/', (req, res) => {
    var fname = req.body.first;
    var lname = req.body.last;
    var email = req.body.mail;
    //console.log(email);
    //res.send("Gotchu");
    var errorCount;
    var data = {
        members: [{
            email_address: email,
            status: "subscribed",
            merge_names: {
                FNAME: fname,
                LNAME: lname
            }
        }]
    }
    var JSONdata = JSON.stringify(data);
    //console.log(data);

    var url = "https://us17.api.mailchimp.com/3.0/lists/d7526de138";

    var options = {
        method: "POST",
        auth: "modiji:94bd7e576d02e21efcbb69dd2a15af5c-us17"
    };

    const request = https.request(url, options, (response) => {
        response.on('data', (data) => {
            var deck = JSON.parse(data);
            console.log(deck);
            errorCount = deck.error_count;

            if(errorCount===0)
            {
                res.sendFile(__dirname+"/success.html");
            }
            else
            {
                res.sendFile(__dirname+"/failure.html");
            }
        });
    });

    request.write(JSONdata);
    request.end();

    

});

//c2501213c20a0fadb7f4e4c7e7a0a5b6-us17

//Key: 94bd7e576d02e21efcbb69dd2a15af5c-us17

//ID: d7526de138