<template>
  <section class="about">
    <div class="details">
      <img class="avatar" :src="currentUser.photo" />
      <h1 class="username">
        {{ currentUser.username }}
      </h1>
    </div>
    <div class="statistic">
      <template v-for="s in statistic" :key="s.title">
        <span class="title">{{ s.title }} {{ s.value }}</span>
      </template>
    </div>
    {{ currentUser }}
  </section>
</template>

<script>
export default {
  name: 'AboutCurrentUser',
  data () {
    return {
      statistic: [
        {
          title: `${this.t("js.users.created_at")}:`,
          value: this.$filters.timeAgo(this.currentUser.created_at)
        }
      ]
    }
  }
}
</script>