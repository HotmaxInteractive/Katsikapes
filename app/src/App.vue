<template>
  <div id="app">

    <!-- menu -->
    <div class="fixed-top">
      <div class="margin-container">
        <app-menu></app-menu>
      </div>
    </div>

    <!-- main content -->
    <div class="margin-container body" :class="'body-' + routeName">
      <div class="view-container" :class="'view-' + routeName">

        <transition :name="transitionName" mode="out-in">
          <router-view></router-view>
        </transition>

      </div>
    </div>

    <!-- footer stuff -->
      <transition name="fade">
    <footer-bar v-if="showFooter"></footer-bar>
      </transition>

  </div>
</template>

<script lang="coffee">
module.exports =
  name: 'app',
  components:
    appMenu: require('components/appMenu')
    footerBar: require('components/footerBar')

  data: ->
    transitionName: 'fadeup'

  watch:
    '$route': (to, fromth)->
      if fromth.name is 'Landing'
        @transitionName = 'landingfade'
      else
        @transitionName = 'fadeup'

  computed:
    routeName: -> return @$store.state.route.name.toLowerCase()
    showFooter: ->
      if @routeName is 'contact' or @routeName is 'landing' then return false else return true;

</script>

<style lang="sass">
@import src/styles/main
#app
  +defaultType(normal)
  margin-bottom: 20px

</style>
