isEmail = require 'validator/lib/isEmail'

module.exports =
  sendMessage: ({commit, state}, {name, email, message})->
    errors = []

    #run basic client validation -- and kick back errors
    if email is '' or isEmail(email) is false
      errors.push('your email sucks')
    if name is ''
      errors.push('your name sucks')
    if message is ''
      errors.push('your message sucks')

    if errors.length
      for error in errors
        console.log error
    else
      console.log 'you good dawg, sending to server'

      #if no errors then send to server and handle the response 
      fetch("#{process.env.SERVER_ADDRESS}/email", {
        method: 'POST'
        headers:
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        body: JSON.stringify {name, email, message}
      })
      .then (res) ->
        console.log res
      .catch (err) -> console.log 'we bad dude', err
