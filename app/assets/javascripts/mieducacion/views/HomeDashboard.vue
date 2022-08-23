<template>
  <div id="site-homepage" class="pt-5 mb-16">
    <v-container fluid class="fill-height home-container">
      <v-row class="fill-height align-self-start">
        <v-col md="3" class="hidden-sm-and-down">
          <DesktopLeftSummary />
        </v-col>
        <v-col md="9" cols="auto" sm="12">

          <campus/>

        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
import SiteBanner from '../components/site-banner.vue'
import Campus from './home/components/campus/Campus.vue'
import DesktopLeftSummary from './home/components/DesktopLeftSummary'
import DesktopRightSummary from './home/components/DesktopRightSummary.vue'

export default {
  name: 'Home',
  components: {
    DesktopLeftSummary,
    DesktopRightSummary,
    Campus,
    SiteBanner,
  },
  metaInfo: {
    title: 'Inicio',
  },
}
</script>

<style scoped>
body {
  background-color: #f4f4f7 !important;
}
</style>
