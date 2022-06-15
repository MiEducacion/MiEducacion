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
        @change="logSelect"
      ></v-select>
      <router-view />
  </div>
</template>

<script>
export default {
    name: 'AdminSettings',
    metaInfo: {
        title: 'Admin'
    },
    methods: {
        logSelect(value) {
            console.log(value)
            this.$router.push({ path: `/admin/settings/${value.id}`});
        }
    },
    data () {
        return { 
            settingsCategories: [{
                id: "general_settings",
                name: I18n.t("js.admin.settings.general_settings")
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
            currentCategory: this.$router.currentRoute.path.split("/")[3]

        }
    }

}
</script>