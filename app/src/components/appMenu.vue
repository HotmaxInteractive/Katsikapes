<template>
  <div id="app_menu">

    <div id="desktopMenu">
      <div id="logo"><router-link to="/">Katsikapes Construction</router-link></div>
      <div class="menu-list">
        <div class="menu-item"><router-link to="/services">Services</router-link></div>
        <div class="menu-item"><router-link to="/work">Work</router-link></div>
        <div class="menu-item"><router-link to="/about">About</router-link></div>
        <div class="menu-item menu-contact"><router-link to="/contact">Contact</router-link></div>
      </div>
    </div>

    <div id="mobileMenu">

      <div class="initialMobileContainer">
        <div id="logo"><router-link to="/">Katsikapes Construction</router-link></div>
        <button class="menuToggle"
          @click="mobileMenu = !mobileMenu"
          :style= "{ backgroundImage: 'url(' + assetPath('_hamburger.svg') + ')' }">toggle</button>
      </div>

      <div class="menu-list" v-if="mobileMenu">
        <div class="menu-item"><router-link to="/services">Services</router-link></div>
        <div class="menu-item"><router-link to="/work">Work</router-link></div>
        <div class="menu-item"><router-link to="/about">About</router-link></div>
        <div class="menu-item menu-contact"><router-link to="/contact">Contact</router-link></div>
      </div>

    </div>

  </div>
</template>

<script lang="coffee">
module.exports =
  name: 'appMenu'
  data: ->
    mobileMenu: false

  mounted: ->
    @$watch 'route', =>
      @mobileMenu = false

  computed:
    route: -> return @$store.state.route.fullPath
  methods:
    assetPath: (image)-> return require('@/assets/' + image)

</script>

<style scoped lang="sass">
@import src/styles/main

#app_menu
  a
    color: $ink_black !important
  #logo
    +superHeader(big)
    text-transform: none
    font-size: 25px
    line-height: 25px
    letter-spacing: 1px

  #desktopMenu
    +screen(mobile)
      display: none
    +flexbox
    +flex-direction(row)
    +justify-content(space-between)
    +align-items(center)
    +subHeader(normal)
    height: 70px
    .menu-list
      +flexbox
      +flex-direction(row)
      +align-items(center)
      .menu-item
        margin-left: 40px
        &.menu-contact
          background-color: $aesthetic_primary
          padding: 10px 15px
          border-radius: 2px

  #mobileMenu
    +screen(desktop)
      display: none
    +screen(tablet)
      display: none

    .initialMobileContainer
      +flexbox
      +flex-direction(row)
      +justify-content(space-between)
      +align-items(center)
      +subHeader(normal)
      height: 70px

      .menuToggle
        outline: 0
        border: 0
        background-size: contain
        background-repeat: no-repeat
        background-position: 50% 50%
        background-color: white
        width: 40px
        height: 40px
        text-indent: -999em
        +clickable


    .menu-list
      margin-bottom: 35px
      +subHeader(normal)
      .menu-item
        padding-bottom: 20px
        &:last-of-type
          padding-bottom: 0


</style>
