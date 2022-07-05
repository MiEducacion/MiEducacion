<template>
<v-row>
    <v-col cols="4" md="3">
        <v-list nav dense>
            <v-list-item :to="`/courses/${$route.params.id}/overview`">
                Overview
            </v-list-item>
            <v-list-item :to="`/courses/${$route.params.id}/students`">
                Students
            </v-list-item>
        </v-list>
    </v-col>
  <v-col class="summary" md="9">
    
      <p v-if="course">{{course.name}}</p>
  </v-col>
  </v-row>
</template>

<script>
export default {
    name: 'CourseOverview',
    data () {
        return {
            course : null
        }
    },
    methods: {
        getCourse() {
            axios.get('/courses/' + this.$route.params.id + '.json')
            .then((response) => {
                  this.course = response.data.course
                })
                .catch((error) => {
                    console.log(error)
                    this.error = true
                })
        }
    },
    mounted () {
        this.getCourse()
    }
}
</script>

<style>

</style>