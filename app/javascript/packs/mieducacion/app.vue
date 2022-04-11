<template>
  <v-app id="mieducacion">
      <LayoutBroker :layouts="layouts" :current="$route.meta.layout" />
  </v-app>
</template>

<script>
window.MiEducacion = {}

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
    title: 'MiEducación',
    // all titles will be injected into this template
    titleTemplate: '%s - MiEducación',
  },
  data() {
    return {
      SiteSettings: null,
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

  mounted() {
   // this.fetchSiteSettings()
     var MiniProfiler = document.createElement("script");
    MiniProfiler.async = true
    MiniProfiler.src =
      '/mini-profiler-resources/includes.js?v=12b4b45a3c42e6e15503d7a03810ff33'
    MiniProfiler.type = 'text/javascript'
    MiniProfiler.id = 'mini-profiler'
    MiniProfiler.setAttribute(
      'data-css-url',
      '/mini-profiler-resources/includes.css?v=12b4b45a3c42e6e15503d7a03810ff33'
    )
    MiniProfiler.setAttribute('data-version', '12b4b45a3c42e6e15503d7a03810ff33')
    MiniProfiler.setAttribute('data-path', '/mini-profiler-resources/')
    MiniProfiler.setAttribute('data-horizontal-position', 'left')
    MiniProfiler.setAttribute('data-vertical-position', 'top')
    MiniProfiler.setAttribute('data-ids', '')
    MiniProfiler.setAttribute('data-trivial', 'false')
    MiniProfiler.setAttribute('data-children', 'false')
    MiniProfiler.setAttribute('data-max-traces', '20')
    MiniProfiler.setAttribute('data-controls', 'false')
    MiniProfiler.setAttribute('data-total-sql-count', 'false')
    MiniProfiler.setAttribute('data-authorized', 'true')
    MiniProfiler.setAttribute('data-toggle-shortcut', 'Alt+P')
    MiniProfiler.setAttribute('data-start-hidden', 'false')
    MiniProfiler.setAttribute('data-collapse-results', 'true')
    MiniProfiler.setAttribute('data-hidden-custom-fields', '')
    MiniProfiler.setAttribute('data-html-container', 'body')
    document.head.append(MiniProfiler)
  }
}
</script>
