<template>
  <div id="v_contact">
    <div class="pageHeader">Contact Us.</div>

    <div class="pageSubHeader">
      <p>
        You can call us, or leave us a message right on this page using the form.
        We would love to hear from you about your project.
        We will get back to you as soon as we can.
      </p>
    </div>

    <div class="split-container">
      <div class="split-item">
          <h3 class="subHeader contactHeader">Our Information</h3>
          <div class="contactInfo">
            <div class="contactTitle">our address.</div>
            <p>241 Chimacum Creek Drive</p>
            <p>Port Hadlock, WA</p>
            <p>98339</p>
          </div>
          <div class="contactInfo">
            <div class="contactTitle">our contact.</div>
            <p>cell: <span>360.301.3280</span></p>
            <p>home: <span>360.385.7351</span></p>
            <p>email: ahkatsikapes@gmail.com</p>
          </div>
      </div>

      <div class="split-item">
        <h3 class="subHeader contactHeader">Get in Touch</h3>
        <input class="contactInput" type="text" placeholder="your name" @input="updateName" :value="formName"/>
        <input class="contactInput" type="email" placeholder="your email" @input="updateEmail" :value="formEmail"/>
        <textarea class="contactInput" placeholder="write us a message here." rows="5" @input="updateMessage" :value="formMessage"></textarea>
        <button type="submit" class="submitButton" @click="sendMessage" :class="{active: messageReady}">Send Your Message</button>
      </div>

    </div>

    <!-- error or success toast -->
    <toast></toast>

  </div>
</template>

<script lang="coffee">
module.exports =
  name: 'contact'

  components:
    toast: require('@/components/toast')

  methods:
    updateName: (e)->     @$store.commit('SET_FORM_NAME', e.target.value)
    updateEmail: (e)->    @$store.commit('SET_FORM_EMAIL', e.target.value)
    updateMessage: (e)->  @$store.commit('SET_FORM_MESSAGE', e.target.value)
    sendMessage: ->
      @$store.dispatch('sendMessage', {
        name: @formName
        email: @formEmail
        message: @formMessage
      })

  computed:
    formName: -> return @$store.state.formName
    formEmail: -> return @$store.state.formEmail
    formMessage: -> return @$store.state.formMessage

    messageReady: ->
      if @formName and @formEmail and @formMessage != '' then true else false

</script>

<style scoped lang="sass">
@import src/styles/main
#v_contact
  .pageHeader,p
    color: white
  .pageSubHeader
    margin-bottom: 80px
    +screen(mobile)
      margin-bottom: 50px
  .contactHeader
    text-align: center
    color: $aesthetic_primary
    &::after
      content: none

  .contactInfo
    margin-bottom: 40px
    position: relative
    z-index: 2
    .contactTitle
      +superHeader(normal)
      color: white
      margin-bottom: 10px
      letter-spacing: 1px
    p
      span
        +subHeader(normal)
        color: white

  .contactInput
    display: block
    width: 100%
    padding: 10px
    margin-bottom: 15px
    +defaultType(normal)
    border: none

  .submitButton
    width: 100%
    padding: 20px
    +subHeader(normal)
    background-color: #4b4c4c
    color: $contact_background
    border: none
    outline: none
    +transition(.2s ease all)
    &.active
      background-color: $aesthetic_primary
      +clickable
      +transition(.2s ease all)
    +screen(mobile)
      margin-bottom: 20px


  .split-item:nth-of-type(1)
    position: relative
    &::before
      content: ''
      position: absolute
      width: 1000px
      height: calc(100vh - 290px)
      right: -40px
      top: -40px
      display: block
      background-color: #4b4c4c
    +screen(mobile)
      &::before
        content: none
</style>
