<template>
  <v-app-bar id="site-header" color="white" flat fixed app>
    <div class="site-header-wrap">
      <div class="title">
        <router-link to="/">
          <img id="site-logo" :src="SiteSettings.site_logo" height="100%" />
        </router-link>
      </div>
      <div class="site-navigation--nav hidden-sm-and-down" role="navigation">
        <v-btn text class="site-nav--btn" to="/courses">
          <v-icon left>mdi-school-outline</v-icon>Cursos</v-btn
        >
        <v-btn text class="site-nav--btn" to="/groups">
          <v-icon left>mdi-account-group-outline</v-icon>Grupos</v-btn
        >
        <v-btn text class="site-nav--btn" to="/resources">
          <v-icon left>mdi-checkbox-multiple-blank-outline</v-icon
          >Recursos</v-btn
        >
        <v-btn text class="site-nav--btn" to="/grades" v-if="currentUser">
          <v-icon left>mdi-star-outline</v-icon>Calificaciones</v-btn
        >
      </div>
      <v-spacer></v-spacer>
      <div class="header-user-panel--nav">
        <NotificationsMenu v-if="currentUser"/>
        <v-btn icon class="mr-2" v-if="currentUser">
          <v-icon>mdi-email-outline</v-icon>
        </v-btn>
        <UserMenu/>
      </div>
    </div>
  </v-app-bar>
</template>

<script>
import NotificationsMenu from './user-notifications-menu.vue'
import UserMenu from './user-menu.vue'
export default {
  components: { NotificationsMenu, UserMenu },
  data() {
    return {
    }
  },
}
</script>
