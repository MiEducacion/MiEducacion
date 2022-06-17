<template>
    <div id="user-profile" class="pt-10 mb-16">
    <v-container fluid class="fill-height user-main align-start">
        <div class="details">
            <div class="u-primary">
                <div class="user-profile-avatar">
                    <v-gravatar class="avatar" :email="currentUser.email" alt="User Avatar" :size="120" />
                </div>

            <div class="primary-textual">
                <div class="user-profile-names">
              <h1 class="full-name">Alexander Barrios</h1>
                <h3 class="role">Student</h3>
            </div>
            </div>

        </div>

<section class="user-primary-navigation">
        <v-tabs class="user-navigation-tabs">
    <v-tab to="profile">Perfil</v-tab>
    <v-tab to="activity">Actividad</v-tab>
    <v-tab to="badges">Insignias</v-tab>
    <v-tab to="preferences">
        <v-icon left small>mdi-wrench</v-icon>
        Preferencias</v-tab>
  </v-tabs>
</section>
        </div>
       <router-view></router-view>
    </v-container>
    </div>

</template>

<script>
export default {
    name: 'UserProfile',
    data () {
        return {
            currentUser: window.MiEducacion.currentUser
        }
    }
}
</script>

<style>

</style>