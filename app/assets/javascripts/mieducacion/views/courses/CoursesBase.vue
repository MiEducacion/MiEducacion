<template>
  <div class="course-base fill-height pt-10">
    <v-container fluid class="course-base-container fill-height align-start pb-10">
      <router-view></router-view>
    </v-container>
  </div>
</template>

<script>
export default {
    name: 'CoursesBase',
    metaInfo: {
        title: 'Courses'
    },

}
</script>
