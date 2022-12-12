<template>
  <div class="fill-height">
    <v-main class="login-required text-center">
      <div>
        <img
          class="mieducacion-login-required-image"
          draggable="false"
          :src="LoginRequiredImage"
        />
        <h2 class="login-required--welcome">{{ t("js.login.welcome_to", {site_name: SiteSettings.site_name}) }}</h2>
        <p class="login-required--subtitle">
          An account is required to access the site. Please ask an existing
          member to invite you or log in to continue.
        </p>
      </div>
    </v-main>
  </div>
</template>

<script>
import LoginRequiredImage from "images/illustrations/login-required-new.png";
import SiteHeader from '../../components/site-header.vue'

export default {
    name: 'PrivateSite',
    metaInfo: {
        title: 'Login Required'
    },
    components: {
      SiteHeader
    },
    data () {
        return {
            LoginRequiredImage
        }
    }

}
</script>