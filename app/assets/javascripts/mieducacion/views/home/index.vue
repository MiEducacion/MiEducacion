<template>
  <div class="homepage-main-outlet">
    <Greeting />
    <custom-header-links></custom-header-links>
  </div>
</template>

<script>
import { useMeta } from 'vue-meta'

import Greeting from '../../components/home/greeting.vue'
export default {
    components: {
        Greeting
    },
    setup () {
      const { meta } = useMeta({})
      meta.title = "Home"
    }
}
</script>