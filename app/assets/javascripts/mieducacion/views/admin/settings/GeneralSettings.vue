<template>
  <div>
    <div class="center">
      <h1>{{ t("js.admin.settings.general_settings.title") }}</h1>
      <v-container>
        <div class="pt-4">
          <v-form @submit.prevent="updateSettings">
            <template v-for="setting in settingsModel">
              <v-row
                class="setting-container"
                :key="setting.name"
                align="start"
              >
                <v-col cols="12" sm="6">
                  <span class="setting-title">
                    {{ t(`js.admin.settings.general_settings.${setting.name}.title`) }}
                  </span>
                </v-col>
                <v-col md="6" sm="12" cols="auto">

                  <!-- Type 0: String -->
                  
                  <v-text-field
                    v-if="setting.type == 0"
                    @input.native="settings[setting.name] = $event.target.value"
                    :value="setting.value"
                    outlined
                    :v-model="settings[setting.name]"
                    dense
                    class="setting-value"
                    type="text"
                    :rules="[() => !!settings[setting.name]|| 'This field is required']"
                    :label="t(`js.admin.settings.general_settings.${setting.name}.title`)"
                    placeholder="MiEducacion"
                    required
                    hide-details
                  ></v-text-field>

                  <!-- Type 1: Boolean -->

                  <v-checkbox
                    v-else-if="setting.type == 1"
                    class="mt-0 setting-value"
                    :input-value="setting.value"
                    :value="setting.value"
                    @change="settings[setting.name] = $event"
                    :v-model="settings[setting.name]"
                    :label="t(`js.admin.settings.general_settings.${setting.name}.description`)"
                  >
                  </v-checkbox>

                  <!-- Type 2: Image -->

                  <div v-else-if="setting.type == 2">
                    <div class="setting-image-uploader">
                      <div class="uploaded-image-preview" :style="`background-image: url('${setting.value}')`">
                        
                      </div>
                    </div>
                  </div>
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
import toast from 'vuetify-toast'

export default {
  name: 'AdminGeneralSettings',
  data() {
    return {
      settings: {},
      btnLoading: null,
      settingsModel: [
        {
          name: 'site_logo',
          type: 2,
          value: this.SiteSettings.site_logo
        },
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
      if(!$.isEmptyObject(this.settings)) {
     this.btnLoading = true
      $.post('/admin/settings/general_settings.json', {
       settings_general: this.settings
      })
      .then((response) => {
        toast.show({text: response.message})
        this.btnLoading = false
})
      .catch((error) => {
        this.error = true
        this.btnLoading = false
        toast.show({text: t('js.core.generic_error')})
      })
    }
     else
    {
      toast.show({text: I18n.t('js.core.error_not_modified')})
    }
    }
  },
}
</script>
