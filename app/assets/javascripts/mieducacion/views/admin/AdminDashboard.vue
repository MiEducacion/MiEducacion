<template>
  <div class="panel">
    <SiteSpinner v-if="!dashboardData" />
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
              {{ dashboardData.version_check.installed_sha | truncate(10)}}
            </a>
            )
          </div>
        </div>
        <div class="version-status">
          <div class="face">
            <span class="up-to-date">
              <v-icon size="3rem">mdi-emoticon-happy-outline</v-icon>
            </span>
          </div>
          <div class="version-notes">You're up to date!</div>
        </div>
        <div class="upgrade-header">
          <a href="#">Updgrade instance</a>
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
