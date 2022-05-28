<template>
  <div class="fill-height">
    <v-app-bar flat color="white" app fixed id="site-header">
      <v-spacer />
      <a href="/">
        <img id="site-logo" :src="SiteSettings.site_logo" height="100%" />
      </a>
      <v-spacer />
    </v-app-bar>
    <v-main class="login-required text-center">
      <div>
        <img
          class="mieducacion-login-required-image"
          draggable="false"
          :src="LoginRequiredImage"
        />
        <h2 class="login-required--welcome">Welcome to {{SiteSettings.title}}</h2>
        <p class="login-required--subtitle">
          An account is required to access the site. Please ask an existing
          member to invite you or log in to continue.
        </p>
        <v-btn class="login-required--btn" href="/users/sign_in">
          <v-icon left>mdi-account</v-icon>
          Login
        </v-btn>
      </div>
    </v-main>
  </div>
</template>

<script>
import LoginRequiredImage from "images/illustrations/login-required.png";

export default {
    name: 'PrivateSite',
    metaInfo: {
        title: 'Login Required'
    },
    data () {
        return {
            LoginRequiredImage
        }
    }

}
</script>