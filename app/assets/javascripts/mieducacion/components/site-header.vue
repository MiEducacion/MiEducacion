<template>
  <header id="site-header">
    <div class="site-header-wrap">
      <div class="title">
        <router-link to="/">
          <img id="site-logo" :src="SiteSettings.site_logo">
        </router-link>
      </div>
      <div class="site-navigation--nav hidden-sm-and-down" role="navigation">
        <router-link class="flex site-nav--btn" to="/courses">
          <GraduationCap :size="20" class="mr-2" />
            {{ t("js.lms.courses") }}
          </router-link
        >
        <router-link class="flex site-nav--btn" to="/groups">
          <GroupsIcon :size="20" class="mr-2" />
            {{ t("js.lms.groups") }}
          </router-link
        >
        <router-link class="flex site-nav--btn" to="/resources">
          <ResourcesIcon :size="20" class="mr-2" />
            {{ t("js.lms.resources") }}
          </router-link
        >
        <router-link class="flex site-nav--btn" to="/grades" v-if="currentUser">
          <ClipboardCheck :size="20" class="mr-2" />
            {{ t("js.lms.grades") }}
          </router-link
        >
      </div>
<!--       <v-spacer></v-spacer>
 -->      <div class="header-user-panel--nav">
<!--         <NotificationsMenu v-if="currentUser"/>
 -->        <div icon class="mr-2" v-if="currentUser">
          <MessageCircle :size="24" />
        </div>
<!--         <UserMenu/>
 -->      </div>
    </div>
  </header>
</template>

<script>
import { MessageCircle, GraduationCap, Users as GroupsIcon, Archive as ResourcesIcon, ClipboardCheck } from 'lucide-vue-next'
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
