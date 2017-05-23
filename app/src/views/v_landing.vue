<template>
  <div id="v_landing">

    <div class="imageContainer" :style= "{ backgroundImage: 'url(' + assetPath('img4.JPG') + ')' }"></div>

    <div class="linkContainer">
      <div class="linkHeader">Some tagline that we have to come up with</div>
      <div class="linkButtons">
        <router-link to="/services"><div class="button l">See our Services</div></router-link>
        <router-link to="/contact"><div class="button r">Get a quote</div></router-link>
      </div>
    </div>

  </div>
</template>

<script lang="coffee">
module.exports =
  name: 'landing',
  data: ->
    something: 'ok'

  computed:
    projects: -> return this.$store.state.projects

  methods:
    assetPath: (image)-> return require('@/assets/' + image)

</script>

<style scoped lang="sass">
@import src/styles/main

#v_landing
  +flexbox
  +justify-content(center)
  +align-items(center)
  height: calc(100% + 4px)
  position: relative

  .imageContainer
    position: absolute
    top: 0
    left: 0
    width: 100%
    height: 100%
    z-index: -2
    background-size: cover
    background-image:
    background-position: 50% 50%
    width: 100%
    height: 100%
    +screen(mobile)
      height: 50%

  .linkContainer
    background-color: white
    border: 30px solid rgba(255, 255, 255, 0.5)
    padding: 30px
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
      font-size: 31px
      line-height: 41px
      max-width: 450px
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
        background-color: $contact_background
        color: white
        padding: 15px 0px
        box-shadow: 6px 6px 0px lightgrey
        &.l
          margin-right: 3px
        &.r
          margin-left: 3px
          background-color: $aesthetic_primary
          color: $contact_background
        +screen(mobile)
          margin: 10px 0
          width: 100%
          &:first-of-type
            margin-right: 0px
          &:last-of-type
            margin-left: 0px


</style>
