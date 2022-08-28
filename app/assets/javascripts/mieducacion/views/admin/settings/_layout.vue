<template>
  <div class="panel settings">
      <SettingCategorySelector />
      <router-view />
  </div>
</template>

<script>
import SettingCategorySelector from '../../../components/admin/settings/category-selector.vue'

export default {
    name: 'AdminSettings',
    components: {
        SettingCategorySelector
    },
    metaInfo: {
        title: 'Admin'
    }
}
</script>