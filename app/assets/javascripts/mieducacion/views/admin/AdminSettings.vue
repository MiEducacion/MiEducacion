<template>
  <div class="panel">
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
      <SiteSpinner />
  </div>
</template>

<script>
export default {
    name: 'AdminSettings',
    metaInfo: {
        title: 'Admin'
    },
    methods: {
        fetchDashboard() {
            $.ajax('/admin/site-settings.json')
        },
        logSelect(value) {
            console.log(value)
        }
    },
    data () {
        return { 
            settingsCategories: [{
                id: 0,
                name: "General"
            },
            {
                id: 1,
                name: "Customization"
            },
            {
                id: 2,
                name: "Login"
            },
            {
                id: 3,
                name: "Email"
            }],
            currentCategory: 0,

        }
    }

}
</script>