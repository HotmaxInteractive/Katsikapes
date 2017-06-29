<template>
  <div id="v_about">
    <div class="pageHeader">
    About Us.
    </div>

    <div class="split-container">
      <div class="split-item">
        <div class="paragraphContainer">
          <h3 class="subHeader">origins</h3>
          <p>
            We take pride in the knowledge that our skills have been passed down through the generations.
            Currently, the third generation is in training.
            As my Dad used to say, you only have one chance to make a first impression.
          </p><p>
            My dad, Jimmy started building in Port Townsend and the Jefferson County area in the 1960's and passed his experience and knowledge down to the next generation.
            He believed that hard work and integrity defined a person and a business. His ideas continue on.
          </p>
        </div>
        <div class="paragraphContainer">
          <h3 class="subHeader">our philosophy</h3>
          <p>
            Build it right the first time, as the saying goes. We make a point to use the proper lay-up and waterproofing techniques to ensure the longevity of your home.
            Protecting your investment is a one of our highest priorities.
            We take extra care to build code compliant and energy efficient homes.
          </p>
        </div>
      </div>

      <div class="split-item">
        <h3 class="subHeader">the team</h3>

        <div class="teamPictureItem" :style= "{ backgroundImage: 'url(' + assetPath('portrait.png') + ')' }">
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
  name: 'about'

  methods:
    assetPath: (image)-> return require('@/assets/' + image)

</script>

<style scoped lang="sass">
@import src/styles/main
#v_about
  .paragraphContainer
    margin-bottom: 10%
    p:last-of-type
      margin-top: 20px
  .teamPictureItem
    position: relative
    height: 50vh
    width: 100%
    background-color: $background_gray
    margin-bottom: 10%
    background-size: cover
    background-position: 50% 50%
    .pictureInfoItem
      position: absolute
      width: calc(100% - 30px)
      left: 0
      background-color: #3a3a3c
      bottom: -20px
      padding: 20px
      .personName
        +subHeader(normal)
        color: white
      .personTitle
        font-size: 13px
        color: $background_gray


</style>
