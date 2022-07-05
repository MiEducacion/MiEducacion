<template>
  <div class="user-dashboard pt-10 mb-16">
    <v-container fluid class="user-container align-start pb-10">
        <v-row>
            <v-col md="18">
                <div class="profile-banner mb-3">
                  <div class="profile-card p-3">
                    <div class="profile-avatar-section">
                        <img src="http://www.gravatar.com/avatar/4874718f4d0515a6b0cc439235f51852?s=120&d=retro&r=g">
                    </div>
                    <div class="user-recognition">
                        <v-chip
                            v-if="currentUser.trusted"
                            class="trusted"
                            >
                            <v-icon left small>
                                mdi-check-decagram
                            </v-icon>
                            Trusted
                        </v-chip>
                        <v-chip
                            v-if="currentUser.moderator"
                            class="moderator"
                            >
                            <v-icon left small>
                                mdi-shield-half-full
                            </v-icon>
                            Moderator
                        </v-chip>
                        <v-chip
                            v-if="currentUser.is_teacher"
                            class="teacher"
                            >
                            <v-icon left small>
                                mdi-school-outline
                            </v-icon>
                            Teacher
                        </v-chip>
                    </div>
                  </div>
                </div>
            </v-col>
        </v-row>
      <v-tabs class="nav-pills" active-class="nav-pills--active" show-arrows>
        <v-tab :to="`/u/${currentUser.id}/activity`" class="mx-2">
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
    name: 'UsersBase'
}
</script>
