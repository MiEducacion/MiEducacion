<template>
  <v-card class="px-4 py-4 my-4 NewPost--card mx-2 mb-8" outlined rounded v-if="currentUser">
    <v-flex class="justify-center" style="align-items: center">
      <h2 class="campus--greeting text-center pb-4">Good Evening, Alexander 
        <img class="greeting-daytime" :src="GreetingNight">
      </h2>
      <v-avatar size="64">
        <v-gravatar :email="currentUser.email" alt="User Avatar" :size="120" class="avatar" />
      </v-avatar>
      <div class="footer-btns">
        <v-btn text rounded color="#4527a0" class="NewPost--btn" dark depressed
          ><v-icon left>mdi-pencil</v-icon> Publicación</v-btn
        >
        <v-btn text rounded color="#4527a0" class="NewPost--btn" dark depressed
          ><v-icon left>mdi-medal</v-icon> Logro</v-btn
        >
        <v-btn text rounded color="#4527a0" class="NewPost--btn" dark depressed
          ><v-icon left>mdi-forum</v-icon> Pregunta</v-btn
        >
      </div>
    </v-flex>
  </v-card>
</template>

<script>
import GreetingDay from 'images/greetings/greeting_day.png'
import GreetingAfternoon from 'images/greetings/greeting_afternoon.png'
import GreetingEvening from 'images/greetings/greeting_evening.png'
import GreetingNight from 'images/greetings/greeting_night.png'




export default {
  name: 'CampusNewPost',
  components: {},
  data() {
    return {
      GreetingDay,
      GreetingAfternoon,
      GreetingEvening,
      GreetingNight,
      currentUser: window.MiEducacion.currentUser
    }
  },
}
</script>

<style></style>
