<template>
  <div class="desktop-right-summary fill-height">
    <v-card outlined class="homepage-tasks--card">
      <v-card-title class="TasksTitle"
        ><v-icon left>mdi-book-edit-outline</v-icon> Mis Tareas</v-card-title
      >
      <img :src="NoTasks" height="auto" width="100%">
      <span class="NoTasks--text">Actualmente no tienes ninguna tarea pendiente.</span>
    </v-card>
  </div>
</template>

<script>
import NoTasks from 'images/illustrations/noTasks.png'
export default {
  name: 'DesktopRightSummary',
  data () {
      return {
          NoTasks
      }
  }
}
</script>

<style></style>
