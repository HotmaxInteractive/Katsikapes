<template>
  <div id="v_contact">
    {{something}} contact
  </div>
</template>

<script lang="coffee">
module.exports =
  name: 'contact',
  data: ->
    something: 'ok'

</script>

<style scoped lang="sass">
@import src/styles/main
#v_contact

</style>
