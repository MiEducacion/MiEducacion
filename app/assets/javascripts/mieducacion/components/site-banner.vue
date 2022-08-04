<template>
  <div id="global-alerts">
    <v-alert
    dismissible
    id="site-banner"
    class="mx-auto site-banner"
    icon="mdi-pin"
    v-if="SiteSettings.show_site_banner"
    transition="scroll-x-reverse-transition"
    >
      <span v-emoji v-md.html.breaks.linkify>{{SiteSettings.site_banner_content}}</span>
    </v-alert>

    <v-alert
    dismissible
    id="site-unconfigured"
    class="mx-auto site-banner"
    icon="mdi-cog"
    v-if="!SiteSettings.wizard_completed && !SiteSettings.bypass_wizard_check"
    transition="scroll-x-reverse-transition"
    >
      <span v-emoji v-md.html.breaks.linkify>{{ t("js.admin.wizard_required") }} <a href="/wizard">{{ t("js.admin.wizard_link") }}</a></span>
    </v-alert>
  </div>
</template>

<script>
export default {
  name: 'SiteBanner'
}
</script>

<style></style>
