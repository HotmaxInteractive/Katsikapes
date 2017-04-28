<template>
  <div id="v_work">

    <div class="pageHeader">Our Work.</div>

    <div id="bigPictureContainer">

      <div class="recentWorkItem" v-for="(project, index) in projects" v-if="index == picIndex">
        <img class="smallPictures" :src= "assetPath(project.projectUrl)"/>
      </div>

    </div>

    <div id="recentWorkContainer">
      <h3 class="subHeader">Recent Work</h3>
        <div id="smallPictureContainer">

          <div class="recentWorkItem" v-for="(project, index) in projects">
            <img @click="loadPicture(index)" class="smallPictures" :src= "assetPath(project.projectUrl)"/>
          </div>

        </div>
    </div>

  </div>
</template>

<script lang="coffee">

module.exports =
  name: 'work'
  data: ->
    something: 'ok'
    picIndex: 0

  computed:
    projects: -> return this.$store.state.projects
  methods:
    assetPath: (image)-> return require('@/assets/' + image)
    loadPicture: (index)-> this.picIndex = index
</script>

<style scoped lang="sass">
#v_work
  #bigPictureContainer
    border: 25px solid white
    height: 40vh
    .pictureTag
      height: 50px
      width: 200px
      background-color: green
  #recentWorkContainer
    height: 20vh
    width: auto
    #smallPictureContainer
      height: 100%
      width: 100%
      align-items: center
      .recentWorkItem
        display: inline-block
        height: 100%
        border: 2px solid green
        .smallPictures
          height: 100%
</style>
