<template>
  <div class="panel">
      <SiteSpinner />
  </div>
</template>

<script>
export default {
    name: 'AdminDashboard',
    metaInfo: {
        title: 'Admin'
    },
    methods: {
        fetchDashboard() {
            $.ajax('/admin/dashboard.json')
        }
    }

}
</script>