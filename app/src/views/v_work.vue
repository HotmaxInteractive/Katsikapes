<template>
  <div id="v_work">

    <div class="pageHeader">Our Work.</div>

    <div id="featuredProjectContainer">
      <button class="featuredButton" @click="moveFeaturedIndex">boop</button>

      <div class="informationStack">
        <transition-group name="fadeup" tag="div">
          <div class="information" v-for="(project, index) in projects" v-if="index == featuredIndex" :key="project">
            <div class="number">{{index + 1}}.</div>
            <div class="type">
              <div>{{project.name}}</div>
              <div>{{project.type}}</div>
            </div>
          </div>
        </transition-group>
      </div>

      <div class="imageStack">
        <transition-group name="fade" tag="div" mode="out-in">
          <div class="imageContainer" v-for="(project, index) in projects" v-if="index == featuredIndex" :key="project">
            <img :src= "assetPath(project.url)"/>
          </div>
        </transition-group>
      </div>

    </div>

    <!-- small projects stack -->
    <div class="recentWorkContainer">
      <h3 class="subHeader">General Contracting</h3>
        <div class="recentWorkItems">
          <div class="recentWorkItem" v-for="(project, index) in projects">
            <div class="imageContainer">
              <img @click="loadPicture(index)" :src= "assetPath(project.url)"/>
            </div>
          </div>
        </div>
    </div>

    <div class="recentWorkContainer">
      <h3 class="subHeader">Framing</h3>
        <div class="recentWorkItems">
          <div class="recentWorkItem" v-for="(project, index) in projects">
            <div class="imageContainer">
              <img @click="loadPicture(index)" :src= "assetPath(project.url)"/>
            </div>
          </div>
        </div>
    </div>

    <div class="recentWorkContainer">
      <h3 class="subHeader">Small Projects</h3>
        <div class="recentWorkItems">
          <div class="recentWorkItem" v-for="(project, index) in projects">
            <div class="imageContainer">
              <img @click="loadPicture(index)" :src= "assetPath(project.url)"/>
            </div>
          </div>
        </div>
    </div>

  </div>
</template>

<script lang="coffee">

module.exports =
  name: 'work'
  data: ->
    featuredIndex: 0
    picIndex: 0


  computed:
    projects: -> return this.$store.state.projects
  methods:
    assetPath: (image)-> return require('@/assets/' + image)
    loadPicture: (index)-> this.picIndex = index

    moveFeaturedIndex: ->
      if @featuredIndex < @projects.length - 1
        @featuredIndex += 1
      else
        @featuredIndex = 0

</script>

<style scoped lang="sass">
@import src/styles/main
#v_work
  overflow: hidden

  #featuredProjectContainer
    width: calc(100% - 200px)
    margin-left: 200px
    margin-bottom: 100px
    position: relative

    .informationStack
      width: 500px
      position: absolute
      top: 80px
      left: -100px
      z-index: 99999

      .information
        background-color: $contact_background
        padding: 0px 20px 20px 30px
        +flexbox
        +flex-direction(row)
        +align-items(flex-end)
        .number
          +superHeader(big)
          font-size: 75px
          line-height: 80px
          max-height: 75px
          color: white
          font-weight: 600
          margin-right: 30px
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
      .imageContainer
        img
          width: 100%
          height: auto

    .featuredButton
      position: absolute
      width: 100px
      height: 90px
      right: 0
      top: 50%
      +translateY(-50%)
      z-index: 99
      background-color: $contact_background
      outline: 0
      border: 0
      opacity: .8
      +clickable

  .recentWorkContainer
    width: calc(100% - 100px)
    margin-left: 100px
    margin-bottom: 80px
    &:nth-last-of-type(1)
      margin-bottom: 30px
    .recentWorkItems
      +flexbox
      +align-items(center)
      +flex-direction(row)
      .recentWorkItem
        +flex(1)
        +clickable
        .imageContainer
          width: 100%
          height: 250px
          overflow: hidden
          img
            width: 100%
            height: auto
</style>
