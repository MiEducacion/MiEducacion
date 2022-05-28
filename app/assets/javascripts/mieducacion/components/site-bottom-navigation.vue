<template>
  <v-bottom-navigation
    v-if="isMobile"
    background-color="#fff"
    color="#4527a0"
    shift
    grow
    fixed
  >
    <v-btn to="/">
      <span>Inicio</span>

      <v-icon>mdi-home</v-icon>
    </v-btn>

    <v-btn to="/courses">
      <span>Cursos</span>

      <v-icon>mdi-school-outline</v-icon>
    </v-btn>

    <v-btn to="/groups">
      <span>Grupos</span>

      <v-icon>mdi-account-group-outline</v-icon>
    </v-btn>

    <v-btn to="/resources">
      <span>Recursos</span>

      <v-icon>mdi-checkbox-multiple-blank-outline</v-icon>
    </v-btn>

    <v-btn to="/grades" v-if="currentUser">
      <span>Calificaciones</span>

      <v-icon>mdi-star-outline</v-icon>
    </v-btn>
  </v-bottom-navigation>
</template>

<script>
export default {
    name: 'SiteBottomNavigation',
    data () {
        return {
            isMobile: window.MiEducacion.mobile,
            currentUser: window.MiEducacion.currentUser
        }
         
         },

    computed: {

    },
  }

</script>

<style>

</style>