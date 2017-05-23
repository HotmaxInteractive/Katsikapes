<template>
  <div class="recentWorkContainer">
    <h3 class="subHeader">{{title}}</h3>

    <div class="recentWorkItems">
      <div class="recentWorkItem" v-for="(project, index) in collection" @click="onClick(assetPath(project.url))" v-if="index < showAmount">
        <div class="expandButton" :style= "{ backgroundImage: 'url(' + assetPath('_plus.svg') + ')' }"></div>
        <div class="imageContainer">
          <div class="image" :style= "{ backgroundImage: 'url(' + assetPath(project.url) + ')' }"></div>
        </div>
      </div>
    </div>

    <div class="showMoreButton" @click="showMoreSwitch = !showMoreSwitch">Show {{display == 'mobile' ? 'more' : 'all'}} from {{title}} <span>&#8594;</span></div>

  </div>
</template>

<script lang="coffee">

module.exports =
  name: 'recentWork'

  props:
    collection: Array
    title: String
    onClick: Function

  data: ->
    showMoreSwitch: false


  computed:
    display: -> return this.$store.state.port
    showAmount: ->
      #if showMore button was hit run through scenerio
      if @showMoreSwitch
        return 30
      else 3

  methods:
    assetPath: (image)-> return require('@/assets/' + image)

</script>

<style lang="sass">
@import src/styles/main
#v_work
  .recentWorkContainer
    width: calc(100% - 200px)
    margin: 0 100px 60px 100px
    position: relative
    +screen(tablet)
      width: calc(100% - 60px)
      margin: 0 30px 60px 30px
    +screen(mobile)
      width: 100%
      margin: 0 0 60px 0
    &:nth-last-of-type(1)
      margin-bottom: 30px

    .recentWorkItems
      +flexbox
      +align-items(center)
      +flex-direction(row)
      +flex-flow(row wrap)
      border: 16px solid white


      .recentWorkItem
        +flex(1)
        flex-basis: 33%
        +clickable
        position: relative
        border: 4px solid white
        +screen(mobile)
          flex-basis: 100%
        .expandButton
          left: 50%
          bottom: 50%
          +translateXYAndRotate(-50%, 50%, 45deg)
        .imageContainer
          width: 100%
          height: 250px
          +screen(mobile)
            height: 200px
          .image
            background-size: cover
            background-position: 50% 50%
            width: 100%
            height: 100%

    .showMoreButton
      padding: 0 0 20px 20px
      background-color: white
      +subHeader(normal)
      +clickable

</style>
