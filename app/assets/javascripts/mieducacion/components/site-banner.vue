<template>
  <div id="global-alerts">
    <div
    id="site-banner"
    class="mx-auto global-notice"
    v-if="SiteSettings.show_site_banner"
    >
      <span v-emoji v-md.html.breaks.linkify>{{SiteSettings.site_banner_content}}</span>
    </div>

    <div
    id="site-unconfigured"
    class="mx-auto global-notice"
    v-if="!SiteSettings.wizard_completed && !SiteSettings.bypass_wizard_check"
    >
      <span v-emoji v-md.html.breaks.linkify>{{ t("js.admin.wizard_required") }} <a href="/wizard" class="text-blue-500">{{ t("js.admin.wizard_link") }}</a></span>
    </div>
  </div>
</template>

<script>
export default {
  name: 'SiteBanner'
}
</script>

<style></style>
