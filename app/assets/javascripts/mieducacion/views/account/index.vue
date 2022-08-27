<template>
  <div class="account-main-outlet">
    <AboutCurrentUser />
  </div>
</template>

<script>
import { useMeta } from 'vue-meta'
import AboutCurrentUser from '../../components/account/about.vue'

export default {
    setup () {
      const { meta } = useMeta({})
      meta.title = "Account"
    },
    components:{
        AboutCurrentUser
    }
}
</script>