<template>
  <div id="site-homepage" class="pt-10 mb-4">
    <SiteBanner/>
    <v-container fluid class="fill-height home-container">
      <!--       <v-alert
        border="top"
        class="text-center mb-10 mt-n4"
        text
        dense
        type="info"
        color="deep-purple accent-4"
      >
        El administrador del sitio deshabilitó las publicaciones en
        "Campus"</v-alert
      > -->
      <v-row class="fill-height align-self-start">
        <v-col md="3" class="hidden-sm-and-down">
          <DesktopLeftSummary />
        </v-col>
        <v-col md="9" cols="auto" sm="12">
         <!--  <v-alert color="#4527a0" dark icon="mdi-firework" dense>
            Te damos la bienvenida a MiEducación
          </v-alert> -->

          <campus/>

           <v-expansion-panels focusable popout class="mt-8">
            <v-expansion-panel>
              <v-expansion-panel-header>
                Aquí hay algunos consejos para que comiences a utilizar el sitio
                😀.
              </v-expansion-panel-header>
              <v-expansion-panel-content>
                Aquí hay algunas cosas para que comiences en MiEducación.
              </v-expansion-panel-content>
            </v-expansion-panel>
          </v-expansion-panels>
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
