<template>
  <div id="site-bottom-nav" class="fixed bottom-0 w-full">
    <div class="inner-content bg-white shadow-lg py-2 flex w-full">
      <template v-for="link in BottomLinks">
        <m-icon-button :title="link.title" class="w-full">
          <component :is="link.icon" />
        </m-icon-button>
      </template>
    </div>

</div>
</template>

<script setup>
import { getCurrentInstance } from 'vue'

import { MessageCircle, GraduationCap, Users as GroupsIcon, Archive as ResourcesIcon, ClipboardCheck, TreeDeciduous } from 'lucide-vue-next'
import mIconButton from './m-icon-button.vue';
const currentUser = getCurrentInstance().appContext.config.globalProperties.currentUser
const t = I18n.t

const BottomLinks = [
  {
    title: t("js.lms.courses"),
    to: '/courses',
    icon: GraduationCap,
    showItem: true
  },
  {
    title: t("js.lms.groups"),
    to: '/groups',
    icon: GroupsIcon,
    showItem: true
  },
  {
    title: t("js.lms.resources"),
    to: '/resources',
    icon: ResourcesIcon,
    showItem: true
  },
  {
    title: t("js.lms.grades"),
    to: '/grades',
    icon: ClipboardCheck,
    showItem: currentUser ? true : false 
  }
]

</script>