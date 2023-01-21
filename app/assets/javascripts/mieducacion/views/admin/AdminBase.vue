<template>
  <div class="admin-dashboard">
    <div class="admin-main-nav">
      <ul class="nav nav-pills">
        <li v-for="link in adminLinks" :key="link.to">
          <router-link class="nav-item" :to="link.to" active-class="admin-nav-active">
            {{ link.title }}
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
  data() {
    return {
      adminLinks: [
        {
          title: this.t("js.admin.nav.dashboard"),
          to: '/admin/dashboard'
        },
        {
          title: this.t("js.admin.nav.settings"),
          to: '/admin/settings'
        },
        {
          title: this.t("js.admin.nav.updater"),
          to: '/admin/updates'
        }
      ]
    }
  }

}
</script>
