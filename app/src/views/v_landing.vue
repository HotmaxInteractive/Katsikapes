<template>
  <div id="v_landing">

    <div class="image-container">
      <div class="link-container">
        <div class="link-header">Some tagline that we have to come up with</div>
        <div class="link-buttons">
          <div class="button">See our Services</div>
          <div class="button">See our past Work</div>
        </div>
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
  height: calc(100% - 20px)
  background-color: #f6f6f6
  +flexbox
  +justify-content(center)
  +align-items(center)

  .link-container
    background-color: white
    padding: 30px
    .link-buttons
      +flexbox
      +align-items(center)
      padding-top: 20px
      .button
        +flex(1)
        text-align: center
        background-color: grey
        color: white
        padding: 10px 0

</style>
