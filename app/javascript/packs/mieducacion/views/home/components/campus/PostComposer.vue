<template>
  <v-bottom-sheet v-model="ComposerShow" inset>
    <v-sheet class="text-center" height="200px">
      <v-btn class="mt-6" text color="error" @click="sheet = !sheet">
        close
      </v-btn>
      <div class="my-3">This is a bottom sheet using the inset prop</div>
    </v-sheet>
  </v-bottom-sheet>
</template>

<script>
  export default {
    name: 'PostComposer',
    data() {
      return {}
    },
    computed: {
      ComposerShow: {
        get() {
          return this.$store.state.PostComposer.ComposerShow
        },
      },
    },
  }
</script>

<style>

</style>
