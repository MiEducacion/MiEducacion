<template>
  <v-app id="mieducacion">
      <LayoutBroker :layouts="layouts" :current="$route.meta.layout || 'ApplicationLayout'" />
  </v-app>
</template>

<script>
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
    data() {
    return {
      layouts,
    }
  },
  metaInfo () {
    return {
      title: this.SiteSettings.title,
      titleTemplate: `%s - ${this.SiteSettings.title}`,
    }
   
  },


}
</script>
