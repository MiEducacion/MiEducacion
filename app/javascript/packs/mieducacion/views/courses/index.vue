<template>
  <div id="site-courses" class="pt-10">
   <site-spinner v-if="!CoursesData"/>
    <v-container v-if="CoursesData" fluid class="fill-height courses-container">
      
    </v-container>
  </div>
</template>

<script>
import siteSpinner from '../../common/site-spinner.vue'
export default {
  components: { siteSpinner },
  metaInfo: {
    title: 'Cursos',
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
