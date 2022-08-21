<template>
   <div class="courses-discover fill-height">
      <SiteSpinner v-if="!CoursesData" />
      <v-container
         v-if="CoursesData"
         fluid
         class="fill-height courses-container align-start"
         >
         <v-col class="py-0 px-0">
            <div class="my-courses pb-4" v-if="currentUser">
               <h2 class="title">My Courses</h2>
               <div class="courses--no-data mx-auto text-center">
                  <img :src="NoDataImage" class="illustration" />
                  <h1 class="title">
                     Actualmente no estás inscripto en ninguna clase.
                  </h1>
               </div>
            </div>
            <div class="explore-courses" :class="currentUser ? 'pt-12' : ''">
               <h2 class="title">Explore courses</h2>
               <p v-if="CoursesData">{{CoursesData.courses}}</p>
               <v-row class="courses-grid">
                  <template v-for="course in CoursesData" :key="course.id">
                     <course-card :courseData="course"></course-card>
                  </template>
               </v-row>
            </div>
         </v-col>
      </v-container>
      <v-btn
         v-if="CoursesData && canCreateCourse"
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
   import CreateCourse from '../../components/modals/courses/CreateCourse.vue'
   import CourseCard from './components/CourseCard.vue'
   
   export default {
     components: { CreateCourse, CourseCard },
     metaInfo: {
       title: 'Cursos',
     },
     data() {
       return {
         loading: null,
         error: null,
         CoursesData: null,
         NoDataImage,
         showCreateCourses : false,
         canCreateCourse: this.currentUser && this.currentUser.is_admin || this.currentUser && this.currentUser.is_teacher
       }
     },
     methods: {
       fetchCourses() {
         axios.get('/courses.json')
           .then((response) => {
             this.CoursesData = response.data.courses
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