<template>
  <div id="site-homepage" class="pt-10">
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
      <v-row align="self-start" class="fill-height">
        <v-col md="3" class="text-center hidden-sm-and-down">
          <DesktopLeftSummary />
        </v-col>
        <v-col md="6" cols="auto" sm="4" class="text-center">
         <!--  <v-alert color="#4527a0" dark icon="mdi-firework" dense>
            Te damos la bienvenida a MiEducación
          </v-alert> -->

          <campus/>

           <v-expansion-panels focusable popout>
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

           <v-virtual-scroll class="full-height"
></v-virtual-scroll>


          <v-btn text class="mt-4" to="/about" block
            >Todas las publicaciones han sido cargadas</v-btn
          >
        </v-col>
        <v-col md="3" class="text-center hidden-xs-only">
          <DesktopRightSummary
        /></v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
import Campus from './components/campus/Campus.vue'
import DesktopLeftSummary from './components/DesktopLeftSummary'
import DesktopRightSummary from './components/DesktopRightSummary.vue'

export default {
  name: 'Home',
  components: {
    DesktopLeftSummary,
    DesktopRightSummary,
    Campus,
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
