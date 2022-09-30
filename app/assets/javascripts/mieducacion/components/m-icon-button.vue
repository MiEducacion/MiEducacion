<template>
  <button class="btn-icon" :title="title">
    <slot />
  </button>
</template>

<script>
  export default {
    props: {
      title: String
    }
  }
</script>
