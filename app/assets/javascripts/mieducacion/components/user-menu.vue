<template>
  <v-menu
    bottom
    left
    offset-y
    transition="slide-y-transition"
    v-if="currentUser"
  >
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
          <v-gravatar
            :email="currentUser.email"
            alt="User Avatar"
            :size="120"
          />
        </v-avatar>
      </v-btn>
    </template>

    <v-list dense>
      <v-list-item active-class="no-active" :to="`/u/${currentUser.id}`">
        <v-list-item-icon>
          <v-icon>mdi-account-circle-outline</v-icon>
        </v-list-item-icon>
        <v-list-item-title>Mi Perfil</v-list-item-title>
      </v-list-item>
      <v-list-item active-class="no-active" :to="`/u/${currentUser.id}/send-invites`">
        <v-list-item-icon>
          <v-icon>mdi-account-plus-outline</v-icon>
        </v-list-item-icon>
        <v-list-item-title>Enviar invitación</v-list-item-title>
      </v-list-item>
      <v-list-item active-class="no-active" :to="`/u/${currentUser.id}/library`">
        <v-list-item-icon>
          <v-icon>mdi-book-outline</v-icon>
        </v-list-item-icon>
        <v-list-item-title>Mi librería</v-list-item-title>
      </v-list-item>
      <v-divider></v-divider>

      <v-list-item active-class="no-active" :to="`/u/${currentUser.id}/settings`">
        <v-list-item-icon>
          <v-icon>mdi-cog-outline</v-icon>
        </v-list-item-icon>
        <v-list-item-title>Configuración</v-list-item-title>
      </v-list-item>

      <v-list-item
        v-if="currentUser.is_admin"
        active-class="no-active"
        exact
        to="/admin"
      >
        <v-list-item-icon>
          <v-icon>mdi-wrench-outline</v-icon>
        </v-list-item-icon>
        <v-list-item-title>Administración</v-list-item-title>
      </v-list-item>
      <v-divider></v-divider>

      <v-list-item active-class="no-active" @click="userLogout">
        <v-list-item-icon>
          <v-icon>mdi-power</v-icon>
        </v-list-item-icon>
        <v-list-item-title>Cerrar Sesión</v-list-item-title>
      </v-list-item>
    </v-list>
  </v-menu>
  <div v-else class="header-buttons">
      <v-btn color="var(--mieducacion-primary)" small dark elevation="0" class="sign-up-button" href="/users/sign_up">
    Sign Up
  </v-btn>
  <v-btn color="var(--mieducacion-primary)" small dark elevation="0" class="login-button" href="/users/sign_in">
    <v-icon left> mdi-account </v-icon>
    Log In
  </v-btn>
  </div>
</template>

<script>
export default {
    methods: {
        userLogout() {
            axios.delete('/users/sign_out', {
              headers: {
                Accept: 'application/json'
              }
            })
            .then(() => {
                window.location.href = "/"
            })
        }
    }
}
</script>