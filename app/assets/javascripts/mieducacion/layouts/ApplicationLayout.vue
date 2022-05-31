<template>
<div>
<v-main id="main-mountpoint">
  <SiteHeader />
  <AnonUserBanner/>
  <slot name="below-site-header" />
  <router-view />
</v-main>
<SiteBottomNavigation />
</div>
</template>

<script>
import SiteHeader from '../components/site-header.vue'
import SiteBottomNavigation from '../components/site-bottom-navigation.vue'
import AnonUserBanner from '../components/anon-user-banner.vue'

export default {
  components: {
    SiteHeader,
    SiteBottomNavigation,
    AnonUserBanner
  },
}
</script>

<style></style>
