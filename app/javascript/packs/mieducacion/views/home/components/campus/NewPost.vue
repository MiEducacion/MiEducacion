<template>
  <v-card class="px-4 py-4 my-4 NewPost--card mx-2 mb-8" outlined rounded>
    <v-flex class="d-flex justify-center" style="align-items: center">
      <v-avatar size="40">
        <img
          src="https://www.yanquisalexander.me/_website/img/alexander.64c2647.webp"
          alt="User Avatar"
        />
      </v-avatar>

      <v-col align-self="center" cols="auto" sm="10">
      
  
      </v-col>
    </v-flex>
    <v-btn color="#4527a0" class="NewPost--send-bnt" dark depressed
      ><v-icon left>mdi-send-outline</v-icon> Publicar</v-btn
    >
  </v-card>
</template>

<script>
export default {
  name: 'CampusNewPost',
  components: {
  },
  data() {
    return {
      text: '',
      renderConfig: {
        rows: 1,
        mermaid: {
          theme: 'dark',
        },
      },
    }
  },
}
</script>

<style></style>
