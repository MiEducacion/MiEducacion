<template>
   <div class="course-base fill-height pt-10 mb-16">
      <div class="course-base-container fill-height align-start pb-10">
         <div class="courses-discover fill-height">
            <m-spinner v-if="!coursesData" />
            <div v-else class="container fill-height courses-container align-start">
               <div class="col py-0 px-0">
                  <div class="my-courses pb-4" v-if="currentUser">
                     <h2 class="title">My Courses</h2>
                     <div class="courses--no-data mx-auto text-center">
                        <img :src="NoDataImage" class="illustration w-2/5" />
                        <h1 class="title">
                           Actualmente no estás inscripto en ninguna clase.
                        </h1>
                     </div>
                  </div>
                  <div class="explore-courses" :class="currentUser ? 'pt-12' : ''">
                     <h2 class="title">Explore courses</h2>
                     <p v-if="coursesData">{{ coursesData.courses }}</p>
                     <div class="grid courses-grid">
                        <template v-for="course in coursesData" :key="course.id">
                           <course-card :courseData="course"></course-card>
                        </template>
                     </div>
                  </div>
               </div>
            </div>
            <button v-if="coursesData && canCreateCourse" @click="openCreateCourseModal()" id="create-course"
               class="extended-fab" :class="{ 'mobile': isMobile }">
               <PlusIcon :size="20" class="icon" />
               Crear curso
            </button>
            <create-course ref="createCourseModal" />
         </div>
      </div>
   </div>
</template>
<script>
import NoDataImage from 'images/illustrations/no_courses.png'
import CreateCourse from '../../components/modals/courses/CreateCourse.vue'
import CourseCard from './components/CourseCard.vue'


export default {
   components: {
      CreateCourse,
      CourseCard
   },
   metaInfo: {
      title: 'Cursos',
   },
   data() {
      return {
         loading: null,
         error: null,
         coursesData: null,
         NoDataImage,
         canCreateCourse: this.currentUser && this.currentUser.can_create_course
      }
   },
   methods: {
      fetchCourses() {
         axios.get('/courses.json')
            .then((response) => {
               this.coursesData = response.data.courses
               console.log(this.coursesData)
            })
            .catch((error) => {
               console.log(error)
               this.error = true
            })
      },
      openCreateCourseModal() {
         this.$refs.createCourseModal.setIsOpen(true);
      }
   },

   mounted() {
      this.fetchCourses()
      MessageBus.subscribe("/courses", (data) => {
         console.log(data)
      });
   },
   unmounted() {
      MessageBus.unsubscribe('/courses')
   }
}
</script>
