<template>
  <div id="app">
    <div class="fixed-top">
      <div class="margin-container">
        <app-menu></app-menu>
      </div>
    </div>

    <div class="margin-container body" :class="'body-' + routeName">
      <div class="view-container" :class="'view-' + routeName">
        <router-view></router-view>
      </div>
    </div>

  </div>
</template>

<script lang="coffee">
module.exports =
  name: 'app',
  components:
    appMenu: require('components/appMenu')

  computed:
    routeName: -> return @$store.state.route.name.toLowerCase()

</script>

<style lang="sass">
@import src/styles/main
#app
  +defaultType(normal)
  margin-bottom: 20px

</style>
