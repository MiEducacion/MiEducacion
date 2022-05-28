<template>
<div>
<v-main id="main-mountpoint">
  <SiteHeader />
  <slot name="below-site-header" />
  <router-view />
</v-main>
<SiteBottomNavigation />
</div>
</template>

<script>
import SiteHeader from '../components/site-header.vue'
import SiteBottomNavigation from '../components/site-bottom-navigation.vue'

export default {
  components: {
    SiteHeader,
    SiteBottomNavigation
  },
}
</script>

<style></style>
