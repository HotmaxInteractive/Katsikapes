<template>

  <div id="v_services">

    <div class="pageHeader">Our Services.</div>

    <div class="pageSubHeader barContainer">
      <p>Build it right the first time, as the saying goes. We make a point to use the proper lay-up and waterproofing techniques to ensure the longevity of your home.
      Protecting your investment is a one of our highest priorities.
      </p>
      <ul id="categories">
        <li @click="scrollToParagraph(1)">General Contracting</li>
        <li @click="scrollToParagraph(2)">Framing</li>
        <li @click="scrollToParagraph(3)">Small Projects</li>
      </ul>
    </div>

    <div class="allParagraphs">
      <div class="paragraphContainer" number="1">
        <h3 class="subHeader">General Contracting</h3>
        <p>
          We are full service contractor. That means we can work on your project, foundation to finish.
          We are equipped to handle every step of the building process.
        </p>
      </div>
      <div class="paragraphContainer" number="2">
        <h3 class="subHeader">Framing</h3>
        <p>
          Whatever design you choose, we can make it happen in a timely and efficient manner.
          From standard framing to advanced framing techniques for super-insulated structures or sound-proof walls.
        </p>
      </div>
      <div class="paragraphContainer" number="3">
        <h3 class="subHeader">Small Projects</h3>
        <p>
          Whether you want to swap a window, remodel your kitchen, or build a custom furniture piece -
          we are equipped for whatever mission you send our way.
        </p>
      </div>
    </div>

  </div>
</template>

<script lang="coffee">
module.exports =
  name: 'services',

  methods:
    scrollToParagraph: (paragraph)->
      scrollPosition = document.querySelectorAll("[number='#{paragraph}']")[0].getBoundingClientRect().top
      cosParameter = (window.pageYOffset - scrollPosition) / 2
      scrollCount = 0
      scrollDuration = 1000
      oldTimestamp = window.performance.now()

      step = (newTimestamp)->
        timeDif = newTimestamp - oldTimestamp
        scrollCount += Math.PI / (scrollDuration / timeDif)

        if (scrollCount >= Math.PI)
          return

        moveStep = Math.round(scrollPosition + cosParameter + cosParameter * Math.cos(scrollCount))
        window.scrollTo(0,moveStep)
        oldTimestamp = newTimestamp
        window.requestAnimationFrame(step)

      window.requestAnimationFrame(step)


</script>

<style scoped lang="sass">
@import src/styles/main
#v_services
  .barContainer
    position: relative
    p
      padding: 0 15px 25px 15px
    &::before
      content: ""
      height: 200px
      width: 100%
      background-color: $background_gray
      position: absolute
      z-index: -2
      max-width: 650px
      margin: 0 auto
      left: 0
      right: 0
      top: -20px
  .allParagraphs
    margin: 0 10%
    position: relative
    max-width: 650px
    margin: 120px auto 0 auto
    .paragraphContainer
      position: relative
      margin-bottom: 80px
      &::after
        content: attr(number) "."
        font-size: 45px
        color: $aesthetic_gray
        position: absolute
        left: -75px
        top: 17px
  #categories
    +flexbox
    +justify-content(center)
    +align-items(center)
    border: 2px solid $border_dark
    background-color: white
    box-shadow: 12px 12px 0 $aesthetic_primary
    padding: 20px 0
    +screen(mobile)
      +flex-direction(column)
      +align-items(flex-start)
    li
      padding: 0 20px
      +subHeader(normal)
      +clickable
</style>
