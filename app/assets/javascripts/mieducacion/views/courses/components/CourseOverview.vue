<template>
  <div class="summary">
      <p v-if="course">{{course}}</p>
  </div>
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