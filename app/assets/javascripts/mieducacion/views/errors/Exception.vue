<template>
  <div class="error-page">
    <div class="face">:(</div>
    <div class="reason">Error</div>
    <div class="desc">
        Something went wrong.
    </div>
    <div class="buttons">
      <v-btn elevation="0" to="/">
        Return to Home
      </v-btn>
    </div>
  </div>
</template>

<script>
export default {
  metaInfo: {
    title: 'Exception',
  }
}
</script>

<style>
</style>