<template>
  <div id="site-campus">
    <v-flex class="flex shrink">
      <new-post />
    </v-flex>
    <v-layout column class="fill-height">
      <v-flex class="overflow-y-auto flex fill-height">
        <feed-post />
        <feed-post />
      </v-flex>
    </v-layout>
  </div>
</template>

<script>
import FeedPost from './FeedPost.vue'
import NewPost from './NewPost.vue'
export default {
  components: { NewPost, FeedPost },
  data () {
    return {
      CampusPosts: null
    }
  },
    methods: {
    fetchCampusPosts() {
      $.ajax('/campus.json')
        .then((response) => {
          this.CampusPosts = response
          console.log(this.CampusPosts)
        })
        .catch((error) => {
          console.log(error)
          this.error = true
        })
    },
    mounted () {
      this.fetchCampusPosts()
    }
  },
}
</script>

<style></style>
