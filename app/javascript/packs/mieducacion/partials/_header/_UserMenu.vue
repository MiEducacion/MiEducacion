<template>
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
              to="/my/profile"
            >
              <v-list-item-icon>
                <v-icon>mdi-account-circle-outline</v-icon>
              </v-list-item-icon>
              <v-list-item-title>Mi Perfil</v-list-item-title>
            </v-list-item>
            <v-list-item
              active-class="no-active"
              onclick="console.log(this)"
              to="/my/preferences"
            >
              <v-list-item-icon>
                <v-icon>mdi-cog-outline</v-icon>
              </v-list-item-icon>
              <v-list-item-title>Configuración</v-list-item-title>
            </v-list-item>

            <v-list-item
              active-class="no-active"
              onclick="console.log(this)"
              to="/admin"
            >
              <v-list-item-icon>
                <v-icon>mdi-wrench-outline</v-icon>
              </v-list-item-icon>
              <v-list-item-title>Administración del Sitio</v-list-item-title>
            </v-list-item>
          </v-list>
        </v-menu>
</template>

<script>
export default {

}
</script>

<style>

</style>