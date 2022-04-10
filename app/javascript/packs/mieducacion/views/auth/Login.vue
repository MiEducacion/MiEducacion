<template>

  <div class="auth--login"><v-app-bar
      clipped-left
      fixed
      flat
      class="app-topbar"
      app
    >
      <v-spacer />

      <v-toolbar-title class="mieducacion-default-header--text mx-6" style="cursor: pointer" @click="$router.push('/')">
        Mi<span>Educación</span>
      </v-toolbar-title>

      <v-spacer />
    </v-app-bar>
    <v-container fill-height fluid>
      <v-row
        align="center"
        justify="center"
      >
        <v-col>
          <v-card class="authentication-card mx-auto">
            <v-row no-gutters>
              <v-col class="auth--card-section-1" cols="12" sm="6">
                <h2 class="auth--card-title pb-4">
                  Inicia sesión
                </h2>
                <span class="auth--card-subtitle">¡Que gusto tenerte de regreso!</span>

                <div class="auth--card-privacy ml-12 pt-6 pb-14">
                  <span class="mx-auto">Al iniciar sesión en MiEducación, aceptas nuestros términos de uso y política de privacidad.</span>
                </div>
              </v-col>
              <v-col cols="12" sm="6" class="auth--card-section-2 text-center mx-auto">
                <div class="pt-8">
                  <v-col
                    v-if="Object.keys(providers).length"
                    class="external-auth--options mx-auto pb-6"
                    cols="12"
                    sm="12"
                  >
                  <template v-for="provider in providers">
                    <v-btn
                      v-if="provider.enabled"
                      :key="provider.id"
                      outlined
                      large
                      class="px-4 login-option mx-auto"
                      elevation="0"
                    >
                      Continuar mediante Centro Educativo
                      {{ provider.id }}
                    </v-btn>
                  </template>
                  </v-col>
                  <v-col class="form--basic-auth mx-auto mt-4" cols="12" sm="12">
                    <form id="login-action" method="POST" action="/auth/sign_in">
                      <v-text-field
                        label="Nombre de Usuario"
                        required
                        name="email"
                        type="email"
                        autocomplete="email"
                        placeholder="user@example.org"
                        outlined
                        dense
                      />

                      <v-text-field
                        label="Contraseña"
                        required
                        autocomplete="current-password"
                        name="password"
                        minlength="8"
                        type="password"
                        outlined
                        dense
                      />
                      <a href="">¿Olvidaste tu contraseña?</a>
                      <br>

                      <v-btn
                        color="primary"
                        large
                        type="submit"
                        class="px-4 mx-auto mt-6 mb-4"
                        elevation="0"
                        block
                      >
                        Iniciar Sesión
                      </v-btn>
                    </form>
                  </v-col>
                </div>
              </v-col>
            </v-row>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
    <v-snackbar
      v-model="snackbar.show"
      :timeout="snackbar.timeout"
    >
      {{ snackbar.text }}

      <template #action="{ attrs }">
        <v-btn
          color="white"
          text
          v-bind="attrs"
          @click="snackbar.show = false"
        >
          Close
        </v-btn>
      </template>
    </v-snackbar>
  </div>
</template>

<script type="text/javascript">
export default {
  auth: 'guest',
  name: 'SignInView',
  layout: 'auth',
  data () {
    return {
      login: {
        username: '',
        password: ''
      },
      snackbar: {
        show: false,
        text: '',
        timeout: 6000
      },
      providers: []
    }
  },
  metaInfo: {
    title: 'Sign In'
  },
  methods: {
    async userLogin () {
      try {
        const response = await this.$auth.loginWith('local', { data: this.login })
        console.log(response)
        this.$router.push('/')
      } catch (err) {
        this.snackbar.text = 'Ha ocurrido un error al iniciar sesión.'
        this.snackbar.show = true
        console.log(err)
      }
    },
 fetchProviders () {
    this.$http
      .get('/site-settings/auth-providers.json')
      .then(response => {
        this.providers = response.data.providers
      })
      .catch(error => {
        console.log(error)
        this.errored = true
      })
      .finally(() => this.loading = false)
  }
  },
  mounted() {
      this.fetchProviders()
  }
}
</script>
