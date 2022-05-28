<template>
  <div class="admin-dashboard pt-10">
    <v-container fluid class="admin-container align-start pb-10">
      <v-tabs class="nav-pills" active-class="nav-pills--active">
        <v-tab to="/admin/dashboard">Dashboard</v-tab>
        <v-tab to="/admin/settings">Settings</v-tab>
        <v-tab>Abstract</v-tab>
      </v-tabs>
      <router-view></router-view>
    </v-container>
  </div>
</template>

<script>
export default {
    name: 'AdminDashboard',
    metaInfo: {
        title: 'Admin'
    },

}
</script>
