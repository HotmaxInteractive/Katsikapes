<template>

  <div id="v_services">

    <div class="pageHeader">Our Services.</div>

    <p>Lorem ipsum dolor sit amet, sed bibendum. Sit ut arcu, a aliquam neque, accumsan sed vivamus urna duis sit, in ac taciti curabitur amet eget bibendum. Elementum massa felis et duis</p>

    <ul id="categories">
      <li>General Contracting</li>
      <li>Framing</li>
      <li>Small Projects</li>
    </ul>

    <div class="paragraphContainer">
      <div class="numbers">1.</div>
      <h3 class="subHeader">General Contracting</h3>
      <p>Lorem ipsum dolor sit amet, sed bibendum. Sit ut arcu, a aliquam neque, accumsan sed vivamus urna duis sit, in ac taciti curabitur amet eget bibendum. Elementum massa felis et duis</p>
    </div>
    <div class="paragraphContainer">
      <div class="numbers">2.</div>
      <h3 class="subHeader">General Contracting</h3>
      <p>Lorem ipsum dolor sit amet, sed bibendum. Sit ut arcu, a aliquam neque, accumsan sed vivamus urna duis sit, in ac taciti curabitur amet eget bibendum. Elementum massa felis et duis</p>
    </div>
    <div class="paragraphContainer">
      <div class="numbers">3.</div>
      <h3 class="subHeader">General Contracting</h3>
      <p>Lorem ipsum dolor sit amet, sed bibendum. Sit ut arcu, a aliquam neque, accumsan sed vivamus urna duis sit, in ac taciti curabitur amet eget bibendum. Elementum massa felis et duis</p>
    </div>
  </div>
</template>

<script lang="coffee">
module.exports =
  name: 'services',
  data: ->
    something: ''

</script>

<style scoped lang="sass">
#v_services
  .paragraphContainer
    position: relative
    margin-left: 10%
    margin-right: 10%
    margin-top: 10%
    &::before
      content: ""
      height: 30%
      width: 100%
      background-color: whitesmoke
      position: absolute
      left: 50%
      transform: translate(-50%, 0)
      z-index: -2
    .numbers
      font-size: 45px
      color: lightgray
      position: absolute
      left: -75px
      top: 30px
  #categories
    position: relative
    display: flex
    justify-content: center
    border: 2px solid #cccdce
    background-color: white
    li
      display: inline-block
      padding-left: 5%
      padding-right: 5%
      padding-top: 5px
      padding-bottom: 5px
      position: relative
    &::after
      position: absolute
      content: ""
      width: 100%
      height: 100%
      background-color: #fac885
      z-index: -1
      top: 15px
      left: 10px

</style>
