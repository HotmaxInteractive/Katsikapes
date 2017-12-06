var express = require('express');
var path = require('path');
var serveStatic = require('serve-static');
var cors = require('cors');
var bodyParser = require('body-parser');

var email = require('./email');

app = express();

var port = process.env.PORT || 3030;
app.listen(port);
console.log('server started on port: '+ port);

app.use(serveStatic(__dirname))
   .use(cors())
   .use(bodyParser.json())
   .use('/email', email); //email route
