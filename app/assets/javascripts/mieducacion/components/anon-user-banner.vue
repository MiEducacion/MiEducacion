<template>
   <div id="anon-banner" class="global-notice anon-banner mt-8"
      v-if="!currentUser"
      >
      You are browsing the site as an anonymous user, register to take full advantage 😁
     
   </div>
</template>
<script>
   export default {
       name: 'AnonUserBanner'
   }
</script>