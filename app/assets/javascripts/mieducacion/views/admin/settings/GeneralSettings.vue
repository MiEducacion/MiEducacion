<template>
  <div>
    <div class="center">
      <h1>{{ t("js.admin.settings.general_settings") }}</h1>
      <v-container>
        <div class="pt-4">
          <v-form @submit.prevent="updateSettings">
            <v-text-field              
              v-model="settings.site_name"
              :value="SiteSettings.title"
              :rules="[() => !!settings.site_name || 'This field is required']"
              label="Site name"
              placeholder="MiEducacion"
              required
            ></v-text-field>
          </v-form>
        </div>
      </v-container>
    </div>
  </div>
</template>

<script>
export default {
  name: 'AdminGeneralSettings',
  data() {
    return {
      settings: {
          site_name: this.SiteSettings.title
      }
    }
      },
        methods: {
    updateSettings () {
      $.post('/admin/settings/general_settings', {
        settings_general: this.settings
      })
    }
  }
}
</script>
