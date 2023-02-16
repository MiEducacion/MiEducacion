<template>
  <Listbox as="div" v-model="currentCategory">
    <ListboxButton class="btn dropdown">{{ t(`js.admin.settings.${currentCategory}.title`) }}</ListboxButton>
    <transition leave-active-class="transition duration-100 ease-in" leave-from-class="opacity-100"
      leave-to-class="opacity-0">
      <ListboxOptions class="dropdown-options">
        <ListboxOption class="option" v-for="category in categories" :key="category.name" :value="category.name">
          {{ t(`js.admin.settings.${category.name}.title`) }}
        </ListboxOption>
      </ListboxOptions>
    </transition>
  </Listbox>
</template>

<script setup>
import { Listbox, ListboxButton, ListboxOptions, ListboxOption } from '@headlessui/vue'
import { ref, getCurrentInstance, watch } from 'vue'

const props = defineProps(['categories'])
const categories = ref(props.categories)
const { emit } = getCurrentInstance()

const currentCategory = ref(props.categories[0].name)

const emitValue = () => {
  emit('update:currentCategory', currentCategory.value)
}

// Llamamos a emitValue cuando el valor de currentCategory cambia
watch(currentCategory, emitValue)

</script>
