<template>
<div>
<v-main id="main-mountpoint">
  <Header />
  <router-view />
</v-main>
<SiteBottomNavigation />
</div>
</template>

<script>
import Header from '../partials/_header.vue'
import SiteBottomNavigation from '../partials/_bottom-navigation.vue'

export default {
  components: {
    Header,
    SiteBottomNavigation
  },
}
</script>

<style></style>
