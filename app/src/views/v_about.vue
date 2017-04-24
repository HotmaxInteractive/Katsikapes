<template>
  <div id="v_about">
    <div class="pageHeader">
    {{something}} about
    </div>

    <div class="split-container">
      <div class="split-item">
        <div>
          <h3 class="subHeader">origins</h3>
          <p>how and where we started and all that</p>
        </div>
        <div>
          <h3 class="subHeader">our philosophy</h3>
          <p>the mantra that we say every morning after coffee</p>
        </div>
      </div>

      <div class="split-item">
        <h3 class="subHeader">the team</h3>

        <div class="teamPictureItem">
          <div class="pictureInfoItem">
            <h4 class="personName">Hazli Katsikapes</h4>
            <h5 class="personTitle">Owner</h5>
          </div>
        </div>

      </div>

    </div>

  </div>
</template>

<script lang="coffee">
module.exports =
  name: 'about',
  data: ->
    something: 'ok'

</script>

<style scoped lang="sass">
@import src/styles/main

#v_about

.teamPictureItem
  position: relative
  height: 20vw
  width: 100%
  background-color: lightgray
  margin-bottom: 50px
  .pictureInfoItem
    position: absolute
    width: calc(100% - 30px)
    left: 0
    background-color: #3a3a3c
    bottom: -20px
    padding: 20px
    .personName
      color: white
      font-family: 'Playfair Display', serif
      font-weight: 700
    .personTitle
      color: lightgray
</style>
