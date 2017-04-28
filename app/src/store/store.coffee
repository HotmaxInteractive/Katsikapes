Vuex = require('vuex')
{ init } = require('./plugins')

state =
  port: ''
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


module.exports = new Vuex.Store({
  state
  mutations
  plugins: [init]
  actions: require './actions'
  strict: process.env.NODE_ENV != 'production'
})
