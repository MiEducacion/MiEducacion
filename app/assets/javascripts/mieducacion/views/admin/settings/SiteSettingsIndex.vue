<template>
  <div>
    <div class="center">
      <h1>{{ t(`js.admin.settings.${category}.title`) }}</h1>
      <div class="pt-4">
        <form @submit.prevent="updateSettings">
          <div class="setting-container" v-for="(setting, index) in settingsModel" :key="setting.key">
            <span class="setting-title">
              {{ t(`js.admin.settings.${category}.${setting.key}.title`) }}
            </span>
            <!-- Type 0: String -->

            <input v-if="setting.type === 'string'" @input="settings[setting.key] = $event.target.value"
              class="setting-value input" type="text" :value="settingsModel[index].value"
              :label="t(`js.admin.settings.${category}.${setting.key}.title`)">

            <!-- Type 1: Boolean -->

            <input type="checkbox" v-else-if="setting.type === 'boolean'" class="mt-0 setting-value"
              @change="settings[setting.key] = $event.target.checked" :checked="settingsModel[index].value"
              :label="t(`js.admin.settings.${category}.${setting.key}.description`)">

            <!-- Type 2: Image -->

            <!-- Type 3: List -->
            <div v-else-if="setting.type === 'list'">
              <Listbox v-model="settings[setting.key]">
                <ListboxButton class="setting-value input">{{ settings[setting.key] || setting.value }}</ListboxButton>
                <ListboxOptions>
                  <ListboxOption v-for="option in setting.options.values" :key="option" :value="option">
                    {{ option }}
                  </ListboxOption>
                </ListboxOptions>
              </Listbox>
            </div>


            <div v-else-if="setting.type === 'image'">
              <div class="setting-image-uploader">
                <div class="uploaded-image-preview" :id="`preview-${setting.key}`"
                  :style="`background-image: url('${setting.value}')`">
                  <div class="image-upload-controls">
                    <m-icon-button :title="`${t('js.admin.image_uploader_title')}`"
                      @click="uploaderButton(`upload-${setting.key}`)">
                      <UploadCloud />
                    </m-icon-button>
                    <input :ref="`upload-${setting.key}`" class="d-none" @change="handleImageChange"
                      :v-model:value="settings[setting.key]" :id="`upload-${setting.key}`" type="file" accept="image/*" />
                  </div>
                </div>
              </div>
            </div>

            <!-- Type 4: Long TextBox -->

            <textarea v-if="setting.type == textarea" @input="settings[setting.name] = $event.target.value"
              :value="setting.value" class="setting-value textarea" type="text"
              :label="t(`js.admin.settings.${category}.${setting.key}.title`)"></textarea>

            <span v-if="setting.type !== 1" class="setting-description" v-html="t(`js.admin.settings.${category}.${setting.key}.description`)"/>


          </div>
          <button :loading="btnLoading" type="submit" @click="updateSettings" class="settings-submit">
            {{ t("js.admin.settings.save") }}
          </button>
        </form>
      </div>
    </div>
    <loading-overlay v-if="btnLoading"></loading-overlay>
</div>
</template>

<script setup>








import { ref, reactive, onMounted, inject, onUpdated } from 'vue'
import {
  Listbox,
  ListboxButton,
  ListboxOptions,
  ListboxOption,
} from '@headlessui/vue'
import MIconButton from '../../../components/m-icon-button.vue'
import loadingOverlay from '../../../components/loading-overlay.vue'

const toast = inject('$toast');
const settings = reactive({})
const btnLoading = ref(null)
var settingsModel = ref(null)
var category = ref(null)
const props = defineProps(['settingsData', 'category'])



function updateSettings(e) {
  e.preventDefault()
  if (Object.keys(settings).length !== 0) {
    const formData = new FormData()
    for (const [key, value] of Object.entries(settings)) {
      formData.append(`setting[${key}]`, value)
    }

    btnLoading.value = true
    axios.post('/admin/site_settings.json', formData)
      .then((response) => {
        toast(
          response.data.message, {
          class: [
            'm-notifier',
            'success'
          ]
        }
        )
        btnLoading.value = false
        window.location.reload()
      })
      .catch((error) => {
        error = true
        btnLoading.value = false
        toast(
          I18n.t('js.core.generic_error')
        )
      })
  } else {
    toast(
      I18n.t('js.core.error_not_modified')
    )
  }
}

function uploaderButton(form) {
  document.getElementById(`${form}`).click()
}

function handleImageChange(e) {
  const data = e.target.files[0]
  settings[`${e.target.id.replace("upload-", "")}`] = data
  const preview = document.getElementById(e.target.id.replace("upload-", "preview-"))
}

onMounted(() => {
  settingsModel.value = props.settingsData
  category.value = props.category
})

onUpdated(() => {
  settingsModel.value = props.settingsData
  category.value = props.category
})

</script>
