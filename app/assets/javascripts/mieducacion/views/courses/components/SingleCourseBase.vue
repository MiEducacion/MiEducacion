<template>
  <div class="single-course-base fill-height pt-10">
    <v-container fluid class="course-container align-start pb-10">
      <router-view></router-view>
    </v-container>
  </div>
</template>

<script>
export default {
    name: 'SingleCourseBase',
    metaInfo: {
        title: 'Course'
    },

}
</script>
