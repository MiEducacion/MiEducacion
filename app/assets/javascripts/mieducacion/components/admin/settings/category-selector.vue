<template>
  <Listbox
    as="div"
    v-model="currentCategory"
  >
    <ListboxButton
      class="btn dropdown"
      >{{ t(`js.admin.settings.${currentCategory}.title`) }}</ListboxButton
    >
    <transition
      leave-active-class="transition duration-100 ease-in"
      leave-from-class="opacity-100"
      leave-to-class="opacity-0"
    >
      <ListboxOptions class="dropdown-options">
        <ListboxOption
          class="option"
          v-for="category in settingsCategories"
          :key="category.id"
          :value="category.id"
        >
          {{ category.name }}
        </ListboxOption>
      </ListboxOptions>
    </transition>
  </Listbox>
</template>
<script setup>
import { Listbox, ListboxButton, ListboxOptions, ListboxOption } from '@headlessui/vue'
</script>
<script>
export default {
  data () {
      return {
          currentCategory: this.$route.path.split("/")[3],
          settingsCategories: [{
              id: "general_settings",
              name: this.t("js.admin.settings.general_settings.title")
          },
          {
              id: "customization",
              name: "Customization"
          },
          {
              id: "security",
              name: "Security"
          },
          {
              id: "smtp",
              name: "Email"
          }],

      }
  },
  methods: {
      navigateTo(value) {
          this.$router.push({ path: `/admin/settings/${value}`});
      }
  },
  watch: {
      currentCategory(value) {
          this.navigateTo(value)
      }
}
}
</script>
