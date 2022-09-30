<template>
  <div>
    <div class="center">
      <h1>{{ t("js.admin.settings.general_settings.title") }}</h1>
        <div class="pt-4">
          <form @submit.prevent="updateSettings">
            <div class="setting-container" v-for="(setting, index) in settingsModel" :key="setting.name">
                  <span class="setting-title">
                    {{ t(`js.admin.settings.general_settings.${setting.name}.title`) }}
                  </span>
                  <!-- Type 0: String -->

                  <input
                    v-if="setting.type == 0"
                    @input="settings[setting.name] = $event.target.value"
                    class="setting-value input"
                    type="text"
                    :value="settingsModel[index].value"
                    :label="t(`js.admin.settings.general_settings.${setting.name}.title`)"
                  >

                  <!-- Type 1: Boolean -->

                  <input type="checkbox"
                    v-else-if="setting.type == 1"
                    class="mt-0 setting-value"
                    @change="settings[setting.name] = $event.target.checked"
                    :checked="settingsModel[index].value"
                    :label="t(`js.admin.settings.general_settings.${setting.name}.description`)"
                  >

                  <!-- Type 2: Image -->

                  <div v-else-if="setting.type == 2">
                    <div class="setting-image-uploader">
                      <div
                        class="uploaded-image-preview"
                        :id="`preview-${setting.name}`"
                        :style="`background-image: url('${setting.value}')`"
                      >
                        <div class="image-upload-controls">
                          <m-icon-button :title="`${t('js.admin.image_uploader_title')}`">
                            <UploadCloud />
                          </m-icon-button>
                          <input
                            :ref="`upload-${setting.name}`"
                            class="d-none"
                            @change="handleImageChange"
                            :v-model:value="settings[setting.name]"
                            :id="`upload-${setting.name}`"
                            type="file"
                            accept="image/*"
                          />
                        </div>
                      </div>
                    </div>
                  </div>

                  <!-- Type 3: Long TextBox -->

                  <textarea
                    v-if="setting.type == 3"
                    @input="settings[setting.name] = $event.target.value"
                    :value="setting.value"
                    class="setting-value textarea"
                    type="text"
                    :label="t(`js.admin.settings.general_settings.${setting.name}.title`)"
                  ></textarea>

                  <span v-if="setting.type !== 1" class="setting-description">
                    {{ t(`js.admin.settings.general_settings.${setting.name}.description`) }}
                  </span>
            </div>
            <button
              :loading="btnLoading"
              type="submit"
              @click="updateSettings"
              class="settings-submit"
            >
              {{t("js.admin.settings.save")}}
            </button>
          </form>
        </div>
    </div>
    <v-overlay color="white" :value="btnLoading">
      <m-spinner />
    </v-overlay>
  </div>
</template>

<script>
import MIconButton from '../../../components/m-icon-button.vue'
export default {
    name: 'AdminGeneralSettings',
    components: {
      MIconButton
    },
    data () {
        return {
            settings: {},
            btnLoading: null,
            settingsModel: [{
                    name: 'site_logo',
                    type: 2,
                    value: this.SiteSettings.site_logo,
                    defaultValue: '/images/default/mieducacion_default_siteLogo.svg'
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
                },
                {
                    name: 'force_redirect_private',
                    type: 1,
                    value: this.SiteSettings.force_redirect_private
                },
                {
                    name: 'show_site_banner',
                    type: 1,
                    value: this.SiteSettings.show_site_banner
                },
                {
                    name: 'site_banner_content',
                    type: 3,
                    value: this.SiteSettings.site_banner_content
                }
            ]
        }
    },
    methods: {
        updateSettings(e) {
          e.preventDefault();
            if (!this.$_.isEmpty(this.settings)) {
                let formData = new FormData()
                this.$_.forEach(this.settings, function(value, key) {
                    formData.append(`settings_generals[${key}]`, value)
                })

                this.btnLoading = true
                axios.post('/admin/settings/general_settings.json',
                        formData
                    )
                    .then((response) => {
                        Notifier.show({
                            message: response.data.message
                        })
                        this.btnLoading = false
                        window.location.reload()
                    })
                    .catch((error) => {
                        this.error = true
                        this.btnLoading = false
                        Notifier.show({
                            message: t('js.core.generic_error')
                        })
                    })
            } else {
                Notifier.show({
                    message: I18n.t('js.core.error_not_modified')
                })
            }
        },
        uploaderButton(form) {
            document.getElementById(`${form}`).click()
        },
        handleImageChange(e) {
            let data = e.target.files[0]
            this.settings[`${e.target.id.replace("upload-", "")}`] = data
            let preview = document.getElementById(e.target.id.replace("upload-", "preview-"))
        }
    }
}
</script>
