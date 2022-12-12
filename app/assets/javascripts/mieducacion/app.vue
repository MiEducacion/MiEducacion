<template>
  <div id="mountpoint">
    <metainfo>
      <template v-slot:title="{ content }">
        {{ content ? `${content} | ${SiteSettings.site_name}` : `${SiteSettings.site_name }` }}
      </template>
    </metainfo>
    <SiteHeader />
    <main class="wrap">
      <SiteBanner/>
        <router-view />
      <GlobalSnackbar ref="toast" />
    </main>
    <SiteBottomNavigation />
  </div>
</template>

<script>

import SiteHeader from './components/site-header.vue'
import SiteBanner from './components/site-banner.vue'
import SiteBottomNavigation from './components/site-bottom-navigation.vue'
import GlobalSnackbar from "./components/global-snackbar.vue";

export default {
  components: {
    SiteHeader,
    SiteBanner,
    SiteBottomNavigation,
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
      title: this.SiteSettings.site_name,
      titleTemplate: `%s - ${this.SiteSettings.site_name}`,
    }
   
  },


}
</script>
