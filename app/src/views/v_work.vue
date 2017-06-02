<template>
  <div id="v_work">

    <div class="pageHeader">Our Work.</div>

    <div class="expandedImageContainer"
      v-if="showExpandedImage"
      @click="showExpandedImage = false">
      <div class="imageContainer">
        <div class="close-btn"><span>x</span> close</div>
        <div class="image" :style= "{ backgroundImage: 'url(' + expandedImageUrl + ')' }"></div>
      </div>
      <div class="backdrop"></div>
    </div>


    <div id="featuredProjectContainer">
      <div class="expandButton" :style= "{ backgroundImage: 'url(' + assetPath('_plus.svg') + ')' }"></div>

      <div class="informationStack">
        <transition-group name="fadeup" tag="div">
          <div class="information" v-for="(project, index) in projects" v-if="index == featuredIndex" :key="project">
            <div class="number">{{index + 1}}.</div>
            <div class="type">
              <div>{{project.name}}</div>
              <div>{{project.type}}</div>
            </div>
            <button class="featuredButton"
                    @click="moveFeaturedIndex"
                    :style= "{ backgroundImage: 'url(' + assetPath('_arrow.svg') + ')' }"></button>
          </div>
        </transition-group>
      </div>

      <div class="imageStack">
        <div class="imageContainer"
             v-for="(project, index) in projects"
             v-if="index == featuredIndex"
             :key="project"
             @click="expandImage(assetPath(project.url))">
          <div class="image" :style= "{ backgroundImage: 'url(' + assetPath(project.url) + ')' }"></div>
        </div>
      </div>
    </div>


    <!--recent work collections -->
    <recent-work
      :title="'General Contracting'"
      :collection="getCollection('gc',7)"
      :onClick="expandImage">
    </recent-work>

    <recent-work
      :title="'Framing'"
      :collection="getCollection('f',6)"
      :onClick="expandImage">
    </recent-work>

    <recent-work
      :title="'Small Projects'"
      :collection="getCollection('sp',22)"
      :onClick="expandImage">
    </recent-work>


  </div>
</template>

<script lang="coffee">

module.exports =
  name: 'work'
  components:
    recentWork: require('@/components/recentWork')

  data: ->
    featuredIndex: 0
    showExpandedImage: false
    expandedImageUrl: ''

  computed:
    projects: -> return this.$store.state.projects

  methods:
    assetPath: (image)-> return require('@/assets/' + image)
    moveFeaturedIndex: ->
      if @featuredIndex < @projects.length - 1
        @featuredIndex += 1
      else
        @featuredIndex = 0
    expandImage: (image)->
      @showExpandedImage = true
      @expandedImageUrl = image

    getCollection: (name, amount)->
      col = []
      for i in [1..amount]
        col.push({url : "#{name}/#{name}" + i + '.png'})
      return col


</script>

<style lang="sass">
@import src/styles/main
#v_work

  .pageHeader
    margin-top: 0
    padding-top: 40px

  .expandedImageContainer
    position: fixed
    width: 100vw
    height: 100vh
    z-index: 999999
    top: 0
    left: 0
    .backdrop
      width: 100%
      height: 100%
      background-color: white
      position: absolute
      left: 0
      top: 0
      z-index: -2
    .imageContainer
      width: calc(100% - 60px)
      height: calc(100% - 60px)
      margin: 30px
      .close-btn
        height: 50px
        text-align: center
        +subHeader(normal)
        +flexbox
        +justify-content(center)
        +align-content(center)
        +clickable
        span
          font-size: 25px
          padding-right: 10px
      .image
        background-size: contain
        background-position: 50% 0%
        background-repeat: no-repeat
        width: 100%
        height: calc(100% - 50px)
        +clickable


  #featuredProjectContainer
    width: calc(100% - 200px)
    margin-left: 200px
    margin-bottom: 80px
    position: relative
    +screen(tablet)
      width: calc(100% - 60px)
      margin-left: 30px
    +screen(mobile)
      width: 100%
      margin-left: 0
      margin-bottom: 120px

    &:hover > .expandButton
      opacity: 1
      +transition(.35s ease all)

    .informationStack
      width: 50%
      position: absolute
      top: 80px
      left: -100px
      z-index: 99999
      +screen(tablet)
        left: 0
        width: 500px
      +screen(mobile)
        width: 100%
        bottom: -70px
        left: 0
        top: inherit

      .information
        background-color: $contact_background
        padding: 0px 70px 20px 30px
        +flexbox
        +flex-direction(row)
        +align-items(flex-end)
        +screen(mobile)
          padding: 20px
        .number
          +superHeader(big)
          font-size: 75px
          line-height: 80px
          max-height: 75px
          color: white
          font-weight: 600
          margin-right: 30px
          +screen(mobile)
            display: none
        .type
          div:first-of-type
            +subHeader(big)
            color: white
          div:last-of-type
            +subHeader(normal)
            color: $aesthetic_primary

    .imageStack
      border: 25px solid white
      border-right: none
      width: 100%
      height: 600px
      overflow: hidden
      +clickable
      +screen(tablet)
        border: 20px solid white
        height: 500px
      +screen(mobile)
        border: none
        height: 300px
        width: 100%
      .imageContainer
        width: 100%
        height: 100%
        .image
          background-size: cover
          background-position: 50% 50%
          width: 100%
          height: 100%


  //general slider buttons rules -- overriden by specific section
  .featuredButton
    position: absolute
    width: 70px
    height: 100%
    top: 0
    right: 0
    z-index: 99
    background-color: $contact_background
    outline: 0
    border: 0
    background-size: 70%
    background-repeat: no-repeat
    background-position: 50% 50%
    margin-right: 12px
    +clickable
  .expandButton
    opacity: 0
    position: absolute
    width: 60px
    height: 60px
    bottom: 60px
    left: 60px
    z-index: 99
    +rotate(45deg)
    background-color: white
    border: 8px solid rgba(255, 255, 255, 0.5)
    background-clip: padding-box
    background-size: 50%
    background-repeat: no-repeat
    background-position: 50% 50%
    //background-image: url('./assets/_plus.svg')
    +flexbox
    +align-items(center)
    +justify-content(center)
    +transition(.35s ease all)
    +screen(mobile)
      left: 50%
      bottom: 50%
      +translateXYAndRotate(-50%, 50%, 45deg)


</style>
