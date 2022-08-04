<template>
  <v-app-bar id="site-header" color="white" flat fixed app>
    <div class="site-header-wrap">
      <div class="title">
        <router-link to="/">
          <img id="site-logo" :src="SiteSettings.site_logo" height="100%" />
        </router-link>
      </div>
      <div class="site-navigation--nav hidden-sm-and-down" role="navigation">
        <v-btn text class="site-nav--btn" to="/courses">
          <GraduationCap :size="20" class="mr-2" />Cursos</v-btn
        >
        <v-btn text class="site-nav--btn" to="/groups">
          <GroupsIcon :size="20" class="mr-2" />Grupos</v-btn
        >
        <v-btn text class="site-nav--btn" to="/resources">
          <ResourcesIcon :size="20" class="mr-2" />Recursos</v-btn
        >
        <v-btn text class="site-nav--btn" to="/grades" v-if="currentUser">
          <ClipboardCheck :size="20" class="mr-2" />Calificaciones</v-btn
        >
      </div>
      <v-spacer></v-spacer>
      <div class="header-user-panel--nav">
        <NotificationsMenu v-if="currentUser"/>
        <v-btn icon class="mr-2" v-if="currentUser">
          <MessageCircle :size="24" />
        </v-btn>
        <UserMenu/>
      </div>
    </div>
  </v-app-bar>
</template>

<script>
import { MessageCircle, GraduationCap, Users as GroupsIcon, Archive as ResourcesIcon, ClipboardCheck } from 'lucide-vue'
import NotificationsMenu from './user-notifications-menu.vue'
import UserMenu from './user-menu.vue'
export default {
  components: { NotificationsMenu, UserMenu, MessageCircle, GraduationCap, GroupsIcon, ResourcesIcon, ClipboardCheck },
  data() {
    return {
    }
  },
}
</script>
