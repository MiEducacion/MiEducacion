<template>
    <div>
      <!-- Renderizamos el componente dinámico en el plugin outlet específico -->
      {{ _pluginComponents }}
      <template v-for="c in _pluginComponents" :key="c">
        <component :is="c" v-bind="componentProps"></component>
      </template>
    </div>
  </template>
  
  <script>
  export default {
    name: 'PluginOutlet',
    props: ['name', 'componentProps'],
    mounted() {
        this._pluginComponents = window.MiEducacion._pluginComponents || []
    }

  }
  </script>