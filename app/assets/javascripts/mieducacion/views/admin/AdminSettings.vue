<template>
  <div class="panel">
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
        }
    }

}
</script>