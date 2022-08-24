<template>
  <div class="home-greeting" v-if="currentUser">
    <h1 class="title" v-emoji>Welcome back 👋</h1>
    <h2 class="subtitle">What will you do today?</h2>
    <section id="quick-shortcuts">
        <div class="quick-shortcuts-container">
            <router-link class="card" to="/account/calendar">
            <div class="inner-div">
                <span class="badge badge-productivity">Productivity</span>
                <h5 class="mt-2 text-xl font-bold text-gray-900" v-emoji>📅 Calendario</h5>
                <p class="block mt-2 text-sm">
                    Check your pending and future tasks.
                </p></div>
            </router-link>
            <router-link class="card" to="/account/materials">
            <div class="inner-div">
                <span class="badge badge-others">Others</span>
                <h5 class="mt-2 text-xl font-bold text-gray-900" v-emoji>📁 Files</h5>
                <p class="block mt-2 text-sm">
                    Explore your uploaded materialss.
                </p></div>
            </router-link>
            <router-link class="card" to="/account/calendar">
            <div class="inner-div">
                <span class="badge badge-personal">Personal</span>
                <h5 class="mt-2 text-xl font-bold text-gray-900" v-emoji>📔 Libreta</h5>
                <p class="block mt-2 text-sm">
                    Make personal notes.
                </p></div>
            </router-link>
        </div>
    </section>
  </div>
</template>

<script>
export default {

}
</script>
