<template>
    <v-container fluid id="nested--activity" class="pb-10">
        <site-spinner class="text-center mx-auto" v-if="!sessionCurrent"/>
          
    </v-container>

</template>

<script>
export default {
    name: 'UserActivity',
    metaInfo: {
        title: 'Actividad'
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