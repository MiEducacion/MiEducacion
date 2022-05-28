<template>
  <div class="desktop-left-summary" v-if="currentUser">
    <v-card class="homepage-user--card p-3 mb-3" outlined>
      <v-card-title class="UserCardTitle"
        ><v-avatar size="36">
          <v-gravatar :email="currentUser.email" alt="User Avatar" :size="120" />
        </v-avatar>
        <p class="ml-3">Alexander Barrios</p></v-card-title
      >
      <v-btn to="/my" text class="UserCard--link mt-n8"
        >Ver mi Perfil <v-icon right>mdi-chevron-right</v-icon></v-btn
      >
    </v-card>

    <v-card class="homepage-classes--card p-3 mb-3" outlined>
      <v-card-title class="ClassesCardTitle">Mis Clases</v-card-title>
      <div class="homepage-classes-empty px-3 pb-2">
        <p>
          <span>Actualmente no te encuentras inscrito en ninguna clase.</span>
        </p>
      </div>
    </v-card>

    <v-card class="homepage-groups--card p-3 mb-3" outlined>
      <v-card-title class="GroupsCardTitle">Mis Grupos</v-card-title>
      <div class="homepage-groups-empty px-3 pb-2">
        <p>
          <span>Todavía no te has unido a ningún grupo.</span>
        </p>
      </div>
    </v-card>
  </div>
</template>

<script>
export default {
  name: 'DesktopLeftSummary',
  data() {
    return {
      currentUser: window.MiEducacion.currentUser
    }
  }
}
</script>

<style></style>
