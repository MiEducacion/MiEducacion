<template>
  <div class="panel">
    <m-spinner v-if="!dashboardData" />
    <section v-else class="version-checks pt-6">
      <div class="section-title">
        <h2>Version</h2>
      </div>
      <div class="dashboard-stats version-check normal">
        <div class="version-number">
          <h4>Installed</h4>
          <h3>
            {{dashboardData.version_check.installed_version}}
          </h3>
          <div class="sha-link">
            (
            <a
              :href="`https://github.com/MiEducacion/MiEducacion/commits/${dashboardData.version_check.installed_sha}`"
              rel="noopener noreferrer"
              target="_blank"
            >
              {{ dashboardData.version_check.installed_sha.substr(0,10) }}
            </a>
            )
          </div>
        </div>
        <div class="version-status">
          <template v-if="!dashboardData.version_check.updates_available">
          <div class="face">
            <span class="up-to-date">
              <SmileIcon :size="48"/>
            </span>
          </div>
          <div class="version-notes">You're up to date!</div>
          </template>
          <template v-else>
          <div class="face">
            <span class="updates-available">
              <SmileIcon :size="48"/>
            </span>
          </div>
          <div class="version-notes">Updates available</div>
          </template>
        </div>
        <div class="upgrade-header">
          <router-link to="/admin/updates">Update instance</router-link>
        </div>
      </div>
    </section>
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
            axios.get('/admin/dashboard.json')
            .then((response) => {
             this.dashboardData = response.data
           })
           .catch((error) => {
             console.log(error)
             this.error = true
           })

        }
    },
    mounted () {
        this.fetchDashboard()
    },
    data () {
        return {
            dashboardData: null
        }
    }
}
</script>
