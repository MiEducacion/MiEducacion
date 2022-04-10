<template>
<v-main id="main-mountpoint">
  <Header />
  <router-view />
</v-main>
</template>

<script>
import Header from '../partials/_header.vue'
export default {
  components: {
    Header,
  },
}
</script>

<style></style>
