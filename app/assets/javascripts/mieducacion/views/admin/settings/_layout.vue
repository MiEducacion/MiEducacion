<template>
  <div class="panel settings">
    <v-select
    class="mt-8"
        dense
        outlined
        v-model="currentCategory"
        solo
        item-text="name"
        item-value="id"
        :items="settingsCategories"
        return-object
        @change="navigateTo"
      ></v-select>
      <router-view />
  </div>
</template>

<script>
import { useRouter, useRoute } from 'vue-router'

export default {
    name: 'AdminSettings',
    setup() {
     const router = useRouter()
     const route = useRoute()

    const currentCategory = router.currentRoute.split("/")[3]
    },
    metaInfo: {
        title: 'Admin'
    },
    methods: {
        navigateTo(value) {
            this.router.push({ path: `/admin/settings/${value.id}`});
        }
    },
    data () {
        return { 
            settingsCategories: [{
                id: "general_settings",
                name: I18n.t("js.admin.settings.general_settings.title")
            },
            {
                id: "customization",
                name: "Customization"
            },
            {
                id: "security",
                name: "Security"
            },
            {
                id: "smtp",
                name: "Email"
            }],

        }
    }

}
</script>