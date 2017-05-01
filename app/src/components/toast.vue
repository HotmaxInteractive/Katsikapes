<template>
  <transition name="fadeup">
    <div id="toast" v-bind:class="{ 'success': !error, 'error': error }" v-show="showToast">

      <div id="symbol"></div>
      <div id="message">{{toast.message}}</div>
      <div id="log-divider" v-if="hasLogs"></div>

      <div id="logs" v-if="hasLogs">
        <div class="log" v-for="(log, index) in toast.errors">
          <span>0{{index + 1}}.</span>
          {{log}}
        </div>
      </div>
    </div>
  </transition>

</template>

<script lang="coffee">
module.exports =
  name: 'toast'

  data: ->
    duration: 7000
    showToast: false

  mounted: ->
    @$watch 'toast', =>
      @flashToast()

  methods:
    flashToast: ->
      if @showToast == true then return
      else
        @showToast = true
        clearTimeout(timeout)
        timeout = setTimeout ( =>
          @showToast = false
        ), @duration

  computed:
    error: ->
      if @toast.code is 200 then return false
      else return true
    hasLogs: ->
      if @toast.errors and Object.keys(@toast.errors).length != 0
        return true
      else return false
    toast: -> return @$store.state.toastMessage

</script>

<style lang="sass">
@import src/styles/main

#toast
  padding: 40px 40px
  position: fixed
  bottom: 40px
  right: 40px
  +subHeader(normal)
  color: white


  #symbol
    display: inline-block
    font-size: $font_size_big
    padding-right: 5px
    vertical-align: middle
  #message
    display: inline-block
    vertical-align: middle
  #log-divider
    display: block
    background-color: white
    height: 3px
    width: 23px
    margin: 17px 0

  #logs
    span
      font-size: $font_size_big
    .log
      padding: 7px 0
      &:last-child
        padding-bottom: 0

.error
  background-color: #ff5151
  #symbol
    &::before
      content: '\1F525'
.success
  background-color: #01BD9D
  #symbol
    &::before
      content: '\1F44C'

</style>
