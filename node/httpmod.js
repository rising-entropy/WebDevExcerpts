const http = require('http');

http.createServer((req, res) => {
    res.write("Hello World!");
    res.end();
}).listen(5000, () => console.log("Server Up and Running!"));

