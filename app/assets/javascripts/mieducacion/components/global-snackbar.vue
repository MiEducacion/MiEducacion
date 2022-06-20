<template>
  <v-snackbar
      :color="color"
      :timeout="timer"
      v-model="showSnackbar"
      bottom
  >
    <v-icon left>{{icon}}</v-icon>{{message}}
    <template v-slot:action="{ attrs }">
        <v-btn
          color="white"
          text
          v-bind="attrs"
          @click="showSnackbar = false"
        >
          Close
        </v-btn>
      </template>
  </v-snackbar>
</template>

<script>
export default {
  name: "GlobalToast",
  data() {
    return{
      showSnackbar: false,
      message: '',
      color: '',
      icon: '',
      timer: 6000
    }
  },
  methods:{
    show(data) {
      this.message = data.message || 'missing "message".'
      this.color = data.color || ''
      this.timer = data.timer || 6000
      this.icon = data.icon || ''
      this.showSnackbar = true
    }
  }
}
</script>