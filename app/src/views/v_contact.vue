<template>
  <div id="v_contact">
    <div class="pageHeader">Contact Us.</div>

    <div class="pageSubHeader">
      <p>
        Lorem ipsum dolor sit amet, sed bibendum.
        Sit ut arcu, a aliquam neque, accumsan sed vivamus urna duis sit, in ac taciti curabitur amet eget bibendum.
        Elementum massa felis et duis.
      </p>
    </div>

    <div class="split-container">

      <div class="split-item">
          <h3 class="subHeader contactHeader">Our Information</h3>
          <div class="contactInfo">
            <div class="contactTitle">our address.</div>
            <p>Something</p>
            <p>Something</p>
            <p>Something</p>
          </div>
          <div class="contactInfo">
            <div class="contactTitle">our contact.</div>
            <p>Something</p>
            <p>Something</p>
            <p>Something</p>
          </div>
      </div>

      <div class="split-item">
        <h3 class="subHeader contactHeader">Get in Touch</h3>
          <input class="contactInput" placeholder="name" @input="updateName" :value="formName"/>
          <input class="contactInput" placeholder="email" @input="updateEmail" :value="formEmail"/>
          <textarea class="contactInput" placeholder="write us a message here." rows="5" @input="updateMessage" :value="formMessage"></textarea>
          <button @click="sendMessage">do it now</button>
      </div>

    </div>

  </div>
</template>

<script lang="coffee">
module.exports =
  name: 'contact',

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

</script>

<style scoped lang="sass">
@import src/styles/main
#v_contact
  .pageHeader,p
    color: white
  .pageSubHeader
    margin-bottom: 100px
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

  .contactInput
    display: block
    width: 100%
    padding: 10px
    margin-bottom: 15px
    +defaultType(normal)
    border: none

  .split-item:nth-of-type(1)
    position: relative
    &::before
      content: ''
      position: absolute
      width: 1000px
      height: calc(100vh - 320px)
      right: -40px
      top: -50px
      display: block
      background-color: #4b4c4c
    +screen(mobile)
      &::before
        content: none
</style>
