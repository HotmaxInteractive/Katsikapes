<template>
  <div id="v_landing">

    <div class="imageContainer"></div>

    <div class="linkContainer">
      <div class="linkHeader">Some tagline that we have to come up with</div>
      <div class="linkButtons">
        <div class="button">See our Services</div>
        <div class="button">See our past Work</div>
      </div>
    </div>

  </div>
</template>

<script lang="coffee">
module.exports =
  name: 'landing',
  data: ->
    something: 'ok'

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
    background-color: red
    z-index: -2

  .linkContainer
    background-color: white
    border: 30px solid rgba(255, 255, 255, 0.5)
    padding: 30px
    background-clip: padding-box
    .linkHeader
      +superHeader(normal)
      letter-spacing: 1px
      font-size: 31px
      line-height: 41px
      max-width: 450px
    .linkButtons
      +flexbox
      +align-items(center)
      padding-top: 20px
      .button
        +flex(1)
        +subHeader(normal)
        width: 230px
        text-align: center
        background-color: $contact_background
        color: white
        padding: 15px 0px
        box-shadow: 6px 6px 0px lightgrey
        &:first-of-type
          margin-right: 3px
        &:last-of-type
          margin-left: 3px


</style>
