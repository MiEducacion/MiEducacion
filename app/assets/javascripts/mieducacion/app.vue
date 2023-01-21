<template>
  <div id="mountpoint">
    <metainfo>
      <template v-slot:title="{ content }">
        {{ content ? `${content} | ${SiteSettings.site_name}` : `${SiteSettings.site_name }` }}
      </template>
    </metainfo>
    <SiteHeader />
    <plugin-outlet name="below-site-header"></plugin-outlet>
    <main class="wrap">
      <SiteBanner/>
        <router-view />
    </main>
    <SiteBottomNavigation />
  </div>
</template>

<script>

import SiteHeader from './components/site-header.vue'
import SiteBanner from './components/site-banner.vue'
import SiteBottomNavigation from './components/site-bottom-navigation.vue'
import PluginOutlet from './components/plugin-outlet.vue';
import { registerComponents } from './lib/register-components'

export default {
  components: {
    SiteHeader,
    SiteBanner,
    SiteBottomNavigation,
    PluginOutlet
  },
    data() {
    return {

}
  },
  created() {
    registerComponents()
  },
  mounted() {
    window.Notifier = {
      show: function() {
      console.warn("Deprecation notice: Notifier has been deprecated, use this.$toast instead")
    }

    }  },
  metaInfo () {
    return {
      title: this.SiteSettings.site_name,
      titleTemplate: `%s - ${this.SiteSettings.site_name}`,
    }
   
  },


}
</script>
