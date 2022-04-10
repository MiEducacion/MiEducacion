<template>
  <v-app-bar id="site-header" color="white" flat fixed app>
    <div class="site-header-wrap">
      <v-app-bar-nav-icon class="d-block d-sm-none"></v-app-bar-nav-icon>
      <div class="title">
        <router-link to="/">
          <img id="site-logo" :src="DefaultSiteLogo" height="100%" />
        </router-link>
      </div>
      <!-- <v-toolbar-title class="mieducacion-default-header--text"
      >Mi<span>Educación</span></v-toolbar-title
    > -->
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
        <v-btn text class="site-nav--btn" to="/grades">
          <v-icon left>mdi-star-outline</v-icon>Calificaciones</v-btn
        >
      </div>
      <v-spacer></v-spacer>
      <div class="header-user-panel--nav">
        <v-btn icon>
          <v-icon>mdi-bell-outline</v-icon>
        </v-btn>

        <v-btn icon class="mr-2">
          <v-icon>mdi-email-outline</v-icon>
        </v-btn>

        <v-menu bottom left offset-y transition="slide-y-transition">
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              icon
              width="auto"
              height="auto"
              id="current-user"
              v-bind="attrs"
              v-on="on"
            >
              <v-avatar size="32">
                <img
                  src="https://www.yanquisalexander.me/_website/img/alexander.64c2647.webp"
                  alt="User Avatar"
                />
              </v-avatar>
            </v-btn>
          </template>

          <v-list dense rounded>
            <v-list-item
              active-class="no-active"
              onclick="console.log(this)"
              to="/my"
            >
              <v-list-item-icon>
                <v-icon>mdi-account-circle-outline</v-icon>
              </v-list-item-icon>
              <v-list-item-title>Mi Perfil</v-list-item-title>
            </v-list-item>
            <v-list-item
              active-class="no-active"
              onclick="console.log(this)"
              to="/my"
            >
              <v-list-item-icon>
                <v-icon>mdi-cog-outline</v-icon>
              </v-list-item-icon>
              <v-list-item-title>Configuración</v-list-item-title>
            </v-list-item>

            <v-list-item
              active-class="no-active"
              onclick="console.log(this)"
              to="/my"
            >
              <v-list-item-icon>
                <v-icon>mdi-wrench-outline</v-icon>
              </v-list-item-icon>
              <v-list-item-title>Administración del Sitio</v-list-item-title>
            </v-list-item>
          </v-list>
        </v-menu>
      </div>
    </div>
  </v-app-bar>
</template>

<script>
import DefaultSiteLogo from 'images/default/mieducacion_default_siteLogo.svg'
export default {
  data() {
    return {
      DefaultSiteLogo,
    }
  },
}
</script>
