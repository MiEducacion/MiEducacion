<template>
  <div class="course-base fill-height pt-10 mb-16">
    <div class="course-base-container fill-height align-start pb-10">
      <router-view></router-view>
    </div>
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
