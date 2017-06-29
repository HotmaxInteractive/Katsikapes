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
      name: 'This needs a title'
      url: 'gc/gc1.png'
      type: 'framing'
    },
    {
      name: 'This also needs a title'
      url: 'sp/sp20.png'
      type: 'framing'
    },
    {
      name: 'another project'
      url: 'sp/sp11.png'
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
