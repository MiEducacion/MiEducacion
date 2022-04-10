<template>
  <v-card class="px-4 py-4 my-4" outlined rounded>
    <v-flex class="d-flex justify-center" style="align-items: center">
      <v-avatar size="40">
        <img
          src="https://www.yanquisalexander.me/_website/img/alexander.64c2647.webp"
          alt="User Avatar"
        />
      </v-avatar>

      <v-col align-self="center" cols="auto" sm="8">
        <v-textarea
          hide-details
          label="¿Que estás pensando, Alexander?"
          outlined
          dense
          rows="1"
          auto-grow
        ></v-textarea>
      </v-col>
    </v-flex>
  </v-card>
</template>

<script>
export default {
  name: 'CampusNewPost',
}
</script>

<style></style>
