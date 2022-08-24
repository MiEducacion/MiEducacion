<template>
  <div class="admin-dashboard">
    <div class="admin-main-nav">
      <ul class="nav nav-pills">
        <li>
          <router-link class="nav-item" to="/admin/dashboard" active-class="admin-nav-active">
            Dashboard
          </router-link>
        </li>
        <li>
          <router-link class="nav-item" to="/admin/settings" active-class="admin-nav-active">
            Settings
          </router-link>
        </li>
      </ul>
    </div>
      <router-view></router-view>
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
