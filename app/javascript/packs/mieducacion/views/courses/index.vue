<template>
  <div id="site-courses" class="pt-10">
   <site-spinner v-if="!CoursesData"/>
    <v-container v-if="CoursesData" fluid class="fill-height courses-container align-start">
      <div class="courses--no-data mx-auto text-center" v-if="!CoursesData.lenght">
        <img :src="NoDataImage" class="illustration"/>
        <h1 class="NoCoursesTitle">
          Actualmente no estás inscripto en ninguna clase.
        </h1>
      </div>
    </v-container>
  </div>
</template>

<script>
import NoDataImage from 'images/illustrations/no_courses.png'

export default {
  metaInfo: {
    title: 'Cursos',
  },
  data() {
    return {
      loading: null,
      error: null,
      CoursesData: null,
      NoDataImage
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
