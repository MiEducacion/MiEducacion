<template>
    <div class="panel settings">
        <SettingCategorySelector v-if="categories" :value="currentCategory" :categories="categories"
            @update:currentCategory="onCurrentCategoryChange" />

        <SiteSettingsIndex v-if="currentCategory && filteredSettings" :settingsData="filteredSettings" :category="currentCategory" />
</div>
</template>

<script setup>


import { onMounted, computed } from 'vue'
import axios from 'axios'
import SettingCategorySelector from '../../../components/admin/settings/category-selector.vue'
import SiteSettingsIndex from './SiteSettingsIndex.vue'
import { ref } from 'vue'

const categories = ref(null)
const currentCategory = ref(null)
const settingsData = ref([])

var filteredSettings = computed(() => {
    if (!currentCategory.value) {
        return settingsData.value;
    }
    return settingsData.value.filter((setting) => setting.category === currentCategory.value);
});

function getCategories() {
    const categories = {};
    settingsData.value.map((setting) => {
        const category = setting.category;
        if (!categories[category]) {
            categories[category] = [];
        }
        categories[category].push(setting);
    });
    return Object.entries(categories).map(([name, settings]) => {
        return { name, settings };
    });
}

const onCurrentCategoryChange = (value) => {
    currentCategory.value = value;
    console.log(value);
}


onMounted(() => {
    axios.get('/admin/site_settings.json').then((r) => {
        settingsData.value = r.data.site_settings
        filteredSettings.value = r.data.site_settings
        categories.value = getCategories()
        currentCategory.value = categories.value[0].name
    })
})
</script>
  
<script>


export default {
    name: 'AdminSettings',
    components: {
        SettingCategorySelector,
        SiteSettingsIndex
    },
    metaInfo: {
        title: 'Admin'
    },
    setup() {
        return {
            categories,
            currentCategory,
            filteredSettings,
            onCurrentCategoryChange,
        }
    },
}
</script>
