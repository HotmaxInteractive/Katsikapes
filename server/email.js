var express = require('express')
var router = express.Router()
var nodemailer = require('nodemailer');


// // middleware that is specific to this router
// router.use(function timeLog (req, res, next) {
//   console.log('Time: ', Date.now())
//   next()
// })

router.post('/', function (req, res, next) {

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
})

module.exports = router
