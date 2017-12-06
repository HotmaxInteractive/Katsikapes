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
    to: 'ahkatsikapes@gmail.com',
    subject: 'Katsikapes Business Email from ' + req.body.name,
    //text: req.body.message
    html: `<p style="background-color:#9ec3fb;padding:15px 30px;margin:0;color: #333333;margin-top: 20px;"><b>New message for Katsikapes Construction, sent from ${req.body.name}</b></p>
           <p style="background-color: #eaeaea;margin: 0;padding: 30px;">${req.body.message}</p>
           <br>
           <p style="padding: 0 30px;"><b>Reply to: ${req.body.email}</b></p>`
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
