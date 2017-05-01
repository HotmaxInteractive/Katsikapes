isEmail = require 'validator/lib/isEmail'

module.exports =
  sendMessage: ({commit, state}, {name, email, message})->
    errors = []

    #run basic client validation -- and kick back errors
    if email is '' or isEmail(email) is false
      errors.push('something is wrong with your email')
    if name is ''
      errors.push("we don't have your name")
    if message is ''
      errors.push("you haven't written a message yet")

    if errors.length
      for error in errors
        commit 'SET_TOAST_MESSAGE', {
          errors: errors
          message: 'There are some problems with your message:'
          code: 400
        }
    else

      #if no errors then send to server and handle the response
      fetch("#{process.env.SERVER_ADDRESS}/email", {
        method: 'POST'
        headers:
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        body: JSON.stringify {name, email, message}
      })
      .then (res) ->
        commit 'SET_TOAST_MESSAGE', {message: "Your message was sent, we'll get back to you soon", code: 200}
        commit 'SET_FORM_NAME', ''
        commit 'SET_FORM_EMAIL', ''
        commit 'SET_FORM_MESSAGE', ''
      .catch (err) ->
        commit 'SET_TOAST_MESSAGE', err
