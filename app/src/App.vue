<template>
  <div id="app">
    <div class="margin-container">
      <app-menu></app-menu>
    </div>

    <div class="margin-container view-container">
      <router-view></router-view>
    </div>

  </div>
</template>

<script lang="coffee">
module.exports =
  name: 'app',
  components:
    appMenu: require('components/appMenu')
</script>

<style lang="sass">
@import src/styles/main
#app
  +defaultType(normal)
  .view-container
    height: calc(100vh - 70px)

</style>
