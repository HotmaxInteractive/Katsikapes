<template>
  <div id="v_landing">

      <transition name="slowfade" appear v-on:after-enter="transitionLinks = true">
    <div class="imageContainer" :style= "{ backgroundImage: 'url(' + assetPath('img4.JPG') + ')' }"></div>
      </transition>

      <transition name="fadeup" appear v-if="transitionLinks" v-on:after-enter="companyHeader = true">
    <div class="linkContainer">
      <div class="linkHeader">Build it right the first time.</div>
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
        <div class="spacer"></div>
        <div class="spacer"></div>
        <div class="spacer"></div>
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
    assetPath: (image)-> return require('@/assets/' + image)

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
      height: 50%

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
      height: 50%

    .companyContainer
      height: 100%
      +flexbox
      +flex-direction(column)
      +align-items(center)
      +justify-content(space-between)
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

  .linkContainer
    background-color: white
    padding: 45px
    background-clip: padding-box
    +screen(mobile)
      height: 50%
      +align-self(flex-end)
      +flexbox
      +flex-direction(column)
      +align-items(center)
      +justify-content(space-around)
      border: none
      padding: 0 30px
      width: 100%
    .linkHeader
      +superHeader(normal)
      letter-spacing: 1px
      font-size: 33px
      line-height: 38px
      max-width: 450px
      text-align: center
      +screen(mobile)
        width: 100%
        font-size: 25px
        line-height: 32px
    .linkButtons
      +flexbox
      +align-items(center)
      +screen(mobile)
        width: 100%
        margin: 0
        padding: 0
        +flex-direction(column)
      padding-top: 20px
      a
        width: 100%
      .button
        +flex(1)
        +subHeader(normal)
        width: 230px
        text-align: center
        background-color: white
        color: $contact_background
        border: 3px solid $contact_background
        padding: 15px 0px
        +transition(.45s ease all)
        &.l
          margin-right: 3px
        &.r
          margin-left: 3px
          //background-color: $aesthetic_primary
          //color: $contact_background
        &:hover
          background-color: $aesthetic_primary
          color: $contact_background
          +transition(.45s ease all)
        +screen(mobile)
          margin: 10px 0
          width: 100%
          &:first-of-type
            margin-right: 0px
          &:last-of-type
            margin-left: 0px

</style>
