<template>
    <v-container fluid id="nested--profile" class="pb-10">
        <m-spinner class="text-center mx-auto" v-if="!sessionCurrent"/>
          
    </v-container>

</template>

<script>
export default {
    name: 'UserProfile',
    metaInfo: {
        title: 'Mi Perfil'
    },
    data () {
        return {
            sessionCurrent: null,
            currentUser: window.MiEducacion.currentUser
        }
    },
      methods: {
    fetchCurrentUser() {
      $.ajax('/session/current.json')
        .then((response) => {
          this.sessionCurrent = response
          console.log(this.sessionCurrent)
        })
        .catch((error) => {
          console.log(error)
          this.error = true
        })
    },
  },
    mounted() {
        this.fetchCurrentUser()
    }
}
</script>

<style>

</style>