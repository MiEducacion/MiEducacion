<template>
  <div id="mieducacion">
    <SiteHeader />
    <main>
      <AnonUserBanner/>
      <slot name="below-site-header" />
        <router-view />
      <GlobalSnackbar ref="toast" />
    </main>
    <SiteBottomNavigation />
  </div>
</template>

<script>

import SiteHeader from './components/site-header.vue'
import SiteBottomNavigation from './components/site-bottom-navigation.vue'
import AnonUserBanner from './components/anon-user-banner.vue'

import GlobalSnackbar from "./components/global-snackbar.vue";


export default {
  components: {
    SiteHeader,
    SiteBottomNavigation,
    AnonUserBanner,
    GlobalSnackbar
  },
    data() {
    return {

}
  },
  mounted() {
    window.Notifier = this.$refs.toast
  },
  metaInfo () {
    return {
      title: this.SiteSettings.title,
      titleTemplate: `%s - ${this.SiteSettings.title}`,
    }
   
  },


}
</script>
