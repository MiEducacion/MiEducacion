<template>
  <div id="global-alerts">
    <template v-for="banner in banners" :key="banner.id">
      <div
        :id="banner.id"
        :class="`mx-auto global-notice ${banner.id}`"
        v-if="banner.show"
      >
        <span v-md.html.breaks.linkify v-emoji v-html="banner.content" />
      </div>
    </template>
  </div>
</template>

<script>
export default {
  data() {
    return {
    banners : [
          {
            id: 'anon-banner',
            content: 'You are browsing the site as an anonymous user, register to take full advantage 😁',
            show: !this.currentUser && this.SiteSettings.public_site
          },
          {
            id: 'site-banner',
            content: this.SiteSettings.site_banner_content,
            show: this.SiteSettings.show_site_banner
          },
          {
            id: 'site-unconfigured',
            content: `${ this.t("js.admin.wizard_required") } [${ this.t("js.admin.wizard_link") }](/wizard)`,
            show: !this.SiteSettings.wizard_completed && !this.SiteSettings.bypass_wizard_check && this.currentUser && this.currentUser.is_admin
          }
        ]
  }
  }
}
</script>
