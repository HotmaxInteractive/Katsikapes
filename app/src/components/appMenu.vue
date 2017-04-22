<template>
  <div id="app_menu">
    <div id="logo"><router-link to="/">Katsikapes Construction</router-link></div>
    <div class="menu-list">
      <div class="menu-item"><router-link to="/services">Services</router-link></div>
      <div class="menu-item"><router-link to="/work">Work</router-link></div>
      <div class="menu-item"><router-link to="/about">About</router-link></div>
      <div class="menu-item menu-contact"><router-link to="/contact">Contact</router-link></div>
    </div>
  </div>
</template>

<script lang="coffee">
module.exports =
  name: 'appMenu',
  data: ->
    something: 'ok'

</script>

<style scoped lang="sass">
@import src/styles/main

#app_menu
  +flexbox
  +flex-direction(row)
  +justify-content(space-between)
  +align-items(center)
  height: 70px
  .menu-list
    +flexbox
    +flex-direction(row)
    .menu-item
      margin-left: 40px
      &.menu-contact
        background-color: yellow

</style>
