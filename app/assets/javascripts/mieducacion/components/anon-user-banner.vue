<template>
   <v-banner
      color="var(--mieducacion-primary)"
      dark
      v-if="!currentUser"
      v-emoji
      app
      single-line
      icon=""
      elevation="0"
      >
      You are browsing the site as an anonymous user, register to take full advantage 😁
      <template v-slot:actions="{ dismiss }">
         <v-btn
            text
            dark
            @click="dismiss"
            >
            Dismiss
         </v-btn>
      </template>
   </v-banner>
</template>
<script>
   export default {
       name: 'AnonUserBanner'
   }
</script>