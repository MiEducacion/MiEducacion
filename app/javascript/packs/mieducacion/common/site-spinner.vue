<template>
    <v-progress-circular
        value="20"
        :size="s_size"
        width="4"
        color="white"
        class="text-center site-spinner align-self-start mx-auto d-flex"
      ></v-progress-circular>
</template>

<script>
export default {
    name: 'SiteSpinner',
    props: {
        s_size: {
            default: 36
        },

}
}
</script>