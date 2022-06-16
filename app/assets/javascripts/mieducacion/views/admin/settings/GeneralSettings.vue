<template>
  <div>
    <div class="center">
      <h1>{{ t("js.admin.settings.general_settings") }}</h1>
      <v-container>
        <div class="pt-4">
          <v-form @submit.prevent="updateSettings">
            <template v-for="setting in settingsModel">
              <div class="setting-container" :key="setting.name">
                <v-text-field
              v-if="setting.type == 0"            
              :v-model="settings[setting.name]"
              :value="setting.value"
              :rules="[() => !!settings[setting.name] || 'This field is required']"
              :label="t(`js.admin.settings.general_settings.${setting.name}`)"
              placeholder="MiEducacion"
              required
            ></v-text-field>
                {{setting}}
              </div>
            </template>
              <v-btn
              :loading="btnLoading"
              color="var(--mieducacion-primary)"
              dark
              elevation="0"
              type="submit"
            >
              {{t("js.admin.settings.save")}}
            </v-btn>
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
      settings: {},
      btnLoading: null,
      settingsModel: [
        {
          name: 'site_name',
          type: 0,
          value: this.SiteSettings.title
        },
        {
          name: 'site_description',
          type: 0,
          value: this.SiteSettings.site_description
        },
        {
          name: 'site_shortname',
          type: 0,
          value: this.SiteSettings.site_shortname
        },
        {
          name: 'public',
          type: 1,
          value: this.SiteSettings.public_site
        }
      ]
    }
      },
        methods: {
    updateSettings () {
     // this.btnLoading = true
     // console.log(this.settings)
      console.log(this.$data)
/*       $.post('/admin/settings/general_settings', {
       settings_general: this.settings
      })
      .then((response) => {
})
                .catch((error) => {
                    console.log(error)
                    this.error = true
                    this.btnLoading = false
                }) */
    },
  },
}
</script>
