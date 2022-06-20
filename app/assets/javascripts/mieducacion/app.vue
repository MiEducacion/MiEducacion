<template>
  <v-app id="mieducacion">
      <LayoutBroker :layouts="layouts" :current="$route.meta.layout || 'ApplicationLayout'" />
      <GlobalSnackbar ref="toast" />
  </v-app>
</template>

<script>
import LayoutBroker from 'vue-layout-broker'

import ApplicationLayout from "./layouts/ApplicationLayout";
import MinimalLayout from "./layouts/MinimalLayout";

import GlobalSnackbar from "./components/global-snackbar.vue";


const layouts = {
  ApplicationLayout,
  MinimalLayout,
}

export default {
  components: {
    LayoutBroker,
    GlobalSnackbar
  },
    data() {
    return {
      layouts,
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
