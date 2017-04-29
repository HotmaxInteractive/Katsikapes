Vuex = require('vuex')
{ init } = require('./plugins')

state =
  port: ''

  formName: ''
  formEmail: ''
  formMessage: ''

  projects: [
    {
      projectTitle: 'pic1',
      projectUrl: 'img1.JPG'
    },
    {
      projectTitle: 'pic2',
      projectUrl: 'img2.JPG'
    },
    {
      projectTitle: 'pic3',
      projectUrl: 'img3.JPG'
    }
  ]

mutations =
  SET_PORT: (state, type)->
    state.port = type

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
