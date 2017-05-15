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
        <button class="menuToggle" @click="mobileMenu = !mobileMenu">toggle</button>
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
  name: 'appMenu',
  data: ->
    mobileMenu: false

  mounted: ->
    @$watch 'route', =>
      @mobileMenu = false

  computed:
    route: -> return @$store.state.route.fullPath

</script>

<style scoped lang="sass">
@import src/styles/main

#app_menu
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

    .menu-list
      margin-bottom: 35px
      +subHeader(normal)
      .menu-item
        padding-bottom: 20px
        &:last-of-type
          padding-bottom: 0


</style>
