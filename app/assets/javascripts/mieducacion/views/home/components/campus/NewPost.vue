<template>
  <v-card class="px-8 py-2 NewPost--card mx-2 mb-8" rounded v-if="currentUser">
    <v-flex shrink class="d-flex" justify-content="start">
      <v-avatar size="40">
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
        ><v-btn text rounded color="#4527a0" class="NewPost--btn" dark depressed
          ><v-icon left>mdi-bullhorn-outline</v-icon> Anunciar</v-btn
        >
      </div>
    </v-flex>
  </v-card>
</template>

<script>
export default {
  name: 'CampusNewPost',
  components: {},
}
</script>

<style></style>
