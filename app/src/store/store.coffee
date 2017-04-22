Vuex = require('vuex')
{ init } = require('./plugins')

state =
  port: ''



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
