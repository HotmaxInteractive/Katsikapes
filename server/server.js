var express = require('express');
var path = require('path');
var serveStatic = require('serve-static');
var cors = require('cors');
var bodyParser = require('body-parser');
var nodemailer = require('nodemailer');

app = express();
app.use(serveStatic(__dirname))
   .use(cors())
   .use(bodyParser.json());

var port = 3030;
app.listen(port);
console.log('server started on port: '+ port);


try {

  app.post('/email', function (req, res, next) {
    var transporter = nodemailer.createTransport({
      service: 'Gmail',
      auth: {
          user: 'long.maxime@gmail.com', // Your email id
          pass: 'wqqakasjchayjgkk'       // Your password
      }
    });

    var mailOptions = {
      from: req.body.email,
      to: 'long.maxime@gmail.com',
      subject: 'Email from ' + req.body.name,
      //text: req.body.message
      html: `<p><b>New message sent from ${req.body.name} -- RESPOND TO: ${req.body.email}</b></p><p>${req.body.message}</p>`    // You can choose to send an HTML body instead
    };

    transporter.sendMail(mailOptions, function(error, info) {
      if (error) {
          console.log(error);
          res.send({message: 'error'});
      } else {
          console.log('Message sent: ' + info.response);
          res.send({message: 'this is ok'});
      };
    });

    next();
  });

} catch(e) {
  console.log (e)
}
