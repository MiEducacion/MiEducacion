<template>
    <v-progress-circular
        :value="20"
        size="36"
        width="4"
        color="white"
        class="text-center site-spinner align-self-start mx-auto d-flex"
      ></v-progress-circular>
</template>

<script>
export default {
    name: 'SiteSpinner'
}
</script>