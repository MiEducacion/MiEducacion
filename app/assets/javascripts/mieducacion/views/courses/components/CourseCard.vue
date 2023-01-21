<template>
   <div md="4" sm="6" cols="12" class="py-0">
      <router-link tag="div" v-ripple class="course-card" v-if="!courseData.private" :to="'/courses/' + courseData.id">
         <div class="mx-auto my-6">
            <img height="10rem" src="/images/default/course-default.svg">
            <p class="course-name">{{ courseData.name }}</p>
         </div>
      </router-link>
   </div>
</template>
<script>
export default {
   name: 'course-card',
   props: ['courseData']
}
</script>
<style>

</style>