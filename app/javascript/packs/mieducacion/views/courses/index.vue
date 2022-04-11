<template>
  <div id="site-courses" class="pt-10">
    <v-container fluid class="fill-height courses-container">
      <v-progress-circular indeterminate></v-progress-circular>
    </v-container>
  </div>
</template>

<script>
export default {
  metaInfo: {
    title: 'Cursos'
  },
  data() {
    return {
      loading: null,
      error: null,
      CoursesData: null,
    }
  },
  methods: {
    fetchCourses() {
      $.ajax('/courses.json')
        .then((response) => {
          this.CoursesData = response
          console.log(this.CoursesData)
        })
        .catch((error) => {
          console.log(error)
          this.error = true
        })
    },
  },

  mounted() {
    this.fetchCourses()
  },
}
</script>

<style></style>
