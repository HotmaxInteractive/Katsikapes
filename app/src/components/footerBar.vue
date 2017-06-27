<template>
  <div id="footerBar">

    <div class="margin-container">
      <div class="footer-container">
        <div class="view-container">
          <div class="split-container">

            <div class="split-item">
              <div class="footer-title">our contact.</div>
              <div class="footer-subtitle">Phone: some number</div>
              <div class="footer-subtitle">Email: someemail@email.com</div>
            </div>
            <div class="split-item">
              <div class="footer-title">our address.</div>
              <div class="footer-subtitle">something on some street</div>
              <div class="footer-subtitle">someplace in america, USA</div>
            </div>

          </div>
        </div>
      </div>
    </div>

  </div>
</template>

<script lang="coffee">
module.exports =
  name: 'footerBar',


</script>

<style lang="sass">
@import src/styles/main

#footerBar
  .footer-container
    background-color: black
    padding: 30px 0
    color: white
    .footer-title
      +superHeader(normal)
      color: white
      margin-bottom: 10px
      letter-spacing: 1px
    .footer-subtitle
      padding: 3px 0

</style>
