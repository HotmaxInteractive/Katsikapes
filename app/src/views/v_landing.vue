<template>
  <div id="v_landing">

      <transition name="slowfade" appear v-on:after-enter="transitionLinks = true">
    <div class="imageContainer" :style= "{ backgroundImage: 'url(' + imagePath('cover.JPG') + ')' }"></div>
      </transition>

      <transition name="fadeup" appear v-if="transitionLinks" v-on:after-enter="companyHeader = true">
    <div class="mobileLinkContainer">
      <div class="linkButtons">
        <router-link to="/services"><div class="button l">See our Services</div></router-link>
        <router-link to="/contact"><div class="button r">Get a quote</div></router-link>
      </div>
    </div>
      </transition>

      <transition name="fadeup" appear v-if="companyHeader">
    <div class="companyTitle">
      <div class="companyContainer">
        <div class="spacer"></div>
        <div class="titleOne">Katsikapes Construction</div>
        <div class="titleTwo">
          <div>A full service contracting company.</div>
          <div>Contact Us: (360).301.3280</div>
        </div>
      </div>
    </div>
      </transition>

  </div>
</template>

<script lang="coffee">
module.exports =
  name: 'landing'

  #transition storage
  data: ->
    transitionLinks: false
    companyHeader: false

  computed:
    projects: -> return @$store.state.projects

  methods:
    imagePath: (image)-> return "https://storage.googleapis.com/kats_images/#{image}"

</script>

<style scoped lang="sass">
@import src/styles/main

#v_landing
  +flexbox
  +justify-content(center)
  +align-items(center)
  position: relative

  .imageContainer
    position: absolute
    top: 0
    left: 0
    width: 100%
    height: 100%
    z-index: -2
    background-size: cover
    background-position: 50% 50%
    width: 100%
    height: 100%
    +screen(mobile)
      height: 70%

  .companyTitle
    position: absolute
    top: 0
    left: 0
    width: 100%
    height: 100%
    z-index: -1
    background-size: cover
    background-position: 50% 50%
    width: 100%
    height: 100%
    +screen(mobile)
      height: 70%

    .companyContainer
      height: 100%
      +flexbox
      +flex-direction(column)
      +align-items(center)
      +justify-content(space-between)
      +screen(mobile)
        +justify-content(center)
      .titleOne
        +superHeader(big)
        color: white
        font-size: 80px
        text-align: center
        +screen(tablet)
          line-height: 80px
        +screen(mobile)
          font-size: 40px
          line-height: 40px
      .spacer
        +screen(mobile)
          display: none
      .titleTwo
        background-color: white
        width: 100%
        height: 50px
        text-align: center
        +flexbox
        +align-items(flex-end)
        +justify-content(space-between)
        +screen(mobile)
          display: none

  .mobileLinkContainer
    background-color: white
    display: none
    height: 30%
    +align-self(flex-end)
    border: none
    padding: 0
    width: 100%
    +screen(mobile)
      display: block

    .linkButtons
      width: 100%
      height: 100%
      +flexbox
      +align-items(center)
      +justify-content(center)
      +flex-direction(column)
      a
        width: 100%
      .button
        margin: 5px 0
        +flex(1)
        +subHeader(normal)
        text-align: center
        background-color: white
        color: $contact_background
        border: 2px solid $contact_background
        border-radius: 2px
        padding: 15px 0px
        width: 100%
        +transition(.45s ease all)


</style>
