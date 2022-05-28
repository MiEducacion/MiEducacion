<template>
  <div class="courses-discover pt-10">
   <SiteSpinner v-if="!CoursesData"/>
    <v-container v-if="CoursesData" fluid class="fill-height courses-container align-start">
      <div class="courses--no-data mx-auto text-center" v-if="!CoursesData.lenght">
        <img :src="NoDataImage" class="illustration"/>
        <h1 class="NoCoursesTitle">
          Actualmente no estás inscripto en ninguna clase.
        </h1>
      </div>
    </v-container>
    <v-btn
        v-if="currentUser.is_admin"
        @click="showCreateCourses = true"
        dark
        right
        bottom
        fixed
        class="courses extended-fab"
        :class="{'mobile' : isMobile}"
        fab
      >
      <v-icon left>mdi-plus</v-icon>
        Crear curso
      </v-btn>
  <create-course v-model="showCreateCourses" />
  </div>
</template>

<script>
import NoDataImage from 'images/illustrations/no_courses.png'
import CreateCourse from '../components/modals/courses/CreateCourse.vue'

export default {
  components: { CreateCourse },
  metaInfo: {
    title: 'Cursos',
  },
  data() {
    return {
      loading: null,
      error: null,
      CoursesData: null,
      NoDataImage,
      showCreateCourses : false
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
