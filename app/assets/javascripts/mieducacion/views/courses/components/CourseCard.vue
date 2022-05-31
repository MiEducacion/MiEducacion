<template>
   <v-col md="4" sm="6" cols="12" class="py-0">
      <router-link tag="div" v-ripple class="course-card" v-if="!courseData.private" :to="'/courses/' + courseData.id">
         <v-card
            class="mx-auto my-6"
            >
            <v-img
               height="10rem"
               src="/images/default/course-default.svg"
               ></v-img>
            <v-card-title class="course-name">{{courseData.name}}</v-card-title>
         </v-card>
      </router-link>
   </v-col>
</template>
<script>
   export default {
       name: 'course-card',
       props: ['courseData']
   }
</script>
<style>
</style>