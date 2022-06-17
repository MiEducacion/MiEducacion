<template>
  <div class="admin-dashboard pt-10 mb-16">
    <v-container fluid class="admin-container align-start pb-10">
      <v-tabs class="nav-pills" active-class="nav-pills--active" show-arrows>
        <v-tab to="/admin/dashboard" class="mx-2">
        <div>
          <v-icon left>mdi-chart-bar-stacked</v-icon>Dashboard
        </div>
        </v-tab>
        <v-tab to="/admin/settings" class="mx-2">
        <div>
          <v-icon left>mdi-cog-outline</v-icon>Settings
        </div>
        </v-tab>
        <v-tab to="/admin/users" class="mx-2">
        <div>
          <v-icon left>mdi-account-group-outline</v-icon>Users
        </div>
        </v-tab>
      </v-tabs>
      <router-view></router-view>
    </v-container>
  </div>
</template>

<script>
export default {
    name: 'AdminBase',
    metaInfo: {
        title: 'Admin'
    },

}
</script>
