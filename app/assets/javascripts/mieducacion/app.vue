<template>
  <div id="mountpoint">
    <metainfo>
      <template v-slot:title="{ content }">
        {{ content ? `${content} | ${SiteSettings.site_name}` : `${SiteSettings.site_name}` }}
      </template>
    </metainfo>
    <SiteHeader />
    <plugin-outlet name="below-site-header"></plugin-outlet>
    <main class="wrap" :class="isMobile ? '!pb-16' : ''">
      <SiteBanner />
      <router-view />
    </main>
    <SiteBottomNavigation v-if="isMobile" />
    <div id="debug-enabled" v-if="DEBUG_ENABLED" @click="callDebugModal">{{ t('js.core.debug_enabled') }}</div>
</div>
</template>

<script>

import SiteHeader from './components/site-header.vue'
import SiteBanner from './components/site-banner.vue'
import SiteBottomNavigation from './components/site-bottom-navigation.vue'
import PluginOutlet from './components/plugin-outlet.vue';
import { registerComponents } from './lib/register-components'
import { DEBUG_ENABLED } from './initializers/debug-mode';

export default {
  components: {
    SiteHeader,
    SiteBanner,
    SiteBottomNavigation,
    PluginOutlet
  },
  data() {
    return {
      DEBUG_ENABLED
    }
  },
  methods: {
    callDebugModal() {
      alert('a')
    }
  },
  created() {
    registerComponents()
  },
  metaInfo() {
    return {
      title: this.SiteSettings.site_name,
      titleTemplate: `%s - ${this.SiteSettings.site_name}`,
    }

  },


}
</script>
