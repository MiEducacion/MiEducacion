<template>
  <v-app id="mieducacion">
      <LayoutBroker :layouts="layouts" :current="$route.meta.layout || 'ApplicationLayout'" />
  </v-app>
</template>

<script>
const SiteSettings = window.MiEducacion.SiteSettings

import LayoutBroker from 'vue-layout-broker'

import ApplicationLayout from "./layouts/ApplicationLayout";
import MinimalLayout from "./layouts/MinimalLayout";

const layouts = {
  ApplicationLayout,
  MinimalLayout,
}

export default {
  components: {
    LayoutBroker,
  },
  metaInfo: {
    // if no subcomponents specify a metaInfo.title, this title will be used
    title: SiteSettings.title,
    // all titles will be injected into this template
    titleTemplate: '%s - '+ SiteSettings.title,
  },
  data() {
    return {
      layouts,
    }
  },

  /* methods: {
    fetchSiteSettings() {
      this.$http
        .get('/site_settings.json')
        .then((response) => {
          this.SiteSettings = response.data
          console.log(this.SiteSettings)
          window.MiEducacion = {
            SiteSettings: response.data,
            name: 'MiEducacion',
          }
        })
        .catch((error) => {
          console.log(error)
          this.errored = true
        })
        .finally(() => (this.loading = false))
    },
  }, */
}
</script>
