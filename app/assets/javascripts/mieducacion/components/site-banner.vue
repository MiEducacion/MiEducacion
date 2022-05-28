<template>
  <v-alert
    dismissible
    id="site_banner"
    class="mx-auto"
    icon="mdi-pin"
    v-if="showSiteBanner"
    transition="scroll-x-reverse-transition"
  >
    <span v-emoji v-md.html.breaks.linkify>{{SiteBanner_Content}}</span>
  </v-alert>
</template>

<script>
var SiteSettings = window.MiEducacion.SiteSettings

export default {
    data () {
        return {
            showSiteBanner: SiteSettings.show_site_banner,
            SiteBanner_Content: SiteSettings.site_banner_content
        }
    }
}
</script>

<style></style>
