<template>
  <div>
    <div class="center">
      <h1>{{ t("js.admin.settings.general_settings.title") }}</h1>
      <v-container>
        <div class="pt-4">
          <v-form @submit.prevent="updateSettings">
            <template v-for="setting in settingsModel">
              <v-row class="setting-container" :key="setting.name" align="start">
                <v-col cols="12" sm="6">
                <span class="setting-title">
                  {{ t(`js.admin.settings.general_settings.${setting.name}.title`) }}
                </span>
                </v-col>
                <v-col md="6" sm="12" cols="auto">
                <v-text-field
                  v-if="setting.type == 0"
                  @input.native="settings = $event.target.value"
                  :value="setting.value"
                  outlined
                  dense
                  class="setting-value"
                  type="text"
                  :rules="[() => !!settings[setting.name]|| 'This field is required']"
                  :label="t(`js.admin.settings.general_settings.${setting.name}.title`)"
                  placeholder="MiEducacion"
                  required
                  hide-details
                ></v-text-field>
                <v-checkbox
                  class="mt-0 setting-value"
                  v-else-if="setting.type == 1"
                  v-model="checkbox"
                  :value="SiteSettings.public_site"
                  :label="t(`js.admin.settings.general_settings.${setting.name}.description`)"
                >
                </v-checkbox>
                <span v-if="setting.type !== 1" class="setting-description">
                {{ t(`js.admin.settings.general_settings.${setting.name}.description`) }}
                </span>
                </v-col>
              </v-row>
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
      settings: [],
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
