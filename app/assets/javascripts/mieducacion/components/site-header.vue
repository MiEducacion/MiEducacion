<template>
  <header id="site-header">
    <div class="site-header-wrap">
      <div class="title">
        <router-link to="/">
          <img id="site-logo" :src="SiteSettings.site_logo" />
        </router-link>
      </div>
      <div class="site-navigation--nav hidden-sm-and-down" role="navigation" v-if="SiteSettings.public_site || currentUser">
        <template v-for="i in HeaderItems" :key="i.to">
          <router-link class="flex site-nav--btn" :to="i.to" v-if="i.showItem">
            <component :is="i.icon" :size="20" class="icon"></component>
            {{ i.title}}
          </router-link>
        </template>
      </div>
      <div class="header-user-panel--nav">
        <div icon class="mr-2 btn-icon" v-if="currentUser">
          <MessageCircle :size="24" />
        </div>
        <UserMenu />
      </div>
    </div>
  </header>
</template>

<script>
import { MessageCircle, GraduationCap, Users as GroupsIcon, Archive as ResourcesIcon, ClipboardCheck, TreeDeciduous } from 'lucide-vue-next'
import NotificationsMenu from './user-notifications-menu.vue'
import UserMenu from './user-menu.vue'
export default {
  components: { NotificationsMenu, UserMenu, MessageCircle, GraduationCap, GroupsIcon, ResourcesIcon, ClipboardCheck },
  data() {
    return {
      HeaderItems : [
        {
          title: this.t("js.lms.courses"),
          to: '/courses',
          icon: GraduationCap,
          showItem: true
        },
        {
          title: this.t("js.lms.groups"),
          to: '/groups',
          icon: GroupsIcon,
          showItem: true
        },
        {
          title: this.t("js.lms.resources"),
          to: '/resources',
          icon: ResourcesIcon,
          showItem: true
        },
        {
          title: this.t("js.lms.grades"),
          to: '/grades',
          icon: ClipboardCheck,
          showItem: !this.$_.isEmpty(this.currentUser)
        }
      ]
    }
  },
}
</script>
