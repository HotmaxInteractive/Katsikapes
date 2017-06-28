<template>
  <div id="v_about">
    <div class="pageHeader">
    About Us.
    </div>

    <div class="split-container">
      <div class="split-item">
        <div class="paragraphContainer">
          <h3 class="subHeader">origins</h3>
          <p>Lorem ipsum dolor sit amet, sed bibendum. Sit ut arcu, a aliquam neque, accumsan sed vivamus urna duis sit, in ac taciti curabitur amet eget bibendum. Elementum massa felis et duis</p>
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
  name: 'about'

</script>

<style scoped lang="sass">
@import src/styles/main
#v_about
  .paragraphContainer
    margin-bottom: 10%
  .teamPictureItem
    position: relative
    height: 50vh
    width: 100%
    background-color: $background_gray
    margin-bottom: 10%
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
