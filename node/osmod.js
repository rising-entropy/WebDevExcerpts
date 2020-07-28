const os = require('os');
console.log(os.platform());
console.log(os.arch());
console.log(os.freemem());
console.log(os.totalmem());
console.log(os.uptime()/(24*60));
