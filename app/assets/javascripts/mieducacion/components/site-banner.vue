<template>
  <v-alert
    dismissible
    id="site-banner"
    class="mx-auto"
    icon="mdi-pin"
    v-if="SiteSettings.show_site_banner"
    transition="scroll-x-reverse-transition"
  >
    <span v-emoji v-md.html.breaks.linkify>{{SiteSettings.site_banner_content}}</span>
  </v-alert>
</template>

<script>
export default {
  name: 'SiteBanner'
}
</script>

<style></style>
