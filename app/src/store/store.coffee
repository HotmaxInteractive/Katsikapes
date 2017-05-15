Vuex = require('vuex')
{ init } = require('./plugins')

state =
  port: ''

  formName: ''
  formEmail: ''
  formMessage: ''

  toastMessage: ''

  projects: [
    {
      name: 'some project'
      url: 'img1.JPG'
      type: 'framing'
    },
    {
      name: 'project again'
      url: 'img2.JPG'
      type: 'framing'
    },
    {
      name: 'another project'
      url: 'img3.JPG'
      type: 'framing'
    }
  ]

mutations =
  SET_PORT: (state, type)->
    state.port = type

  SET_TOAST_MESSAGE: (state, message)->
    state.toastMessage = message

  SET_FORM_NAME: (state, name)->
    state.formName = name
  SET_FORM_EMAIL: (state, email)->
    state.formEmail = email
  SET_FORM_MESSAGE: (state, message)->
    state.formMessage = message


module.exports = new Vuex.Store({
  state
  mutations
  plugins: [init]
  actions: require './actions'
  strict: process.env.NODE_ENV != 'production'
})
