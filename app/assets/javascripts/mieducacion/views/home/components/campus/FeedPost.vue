<template>
  <v-card outlined class="mx-2 mb-6">
    <v-card-title class="py-1">
      <v-list-item class="grow">
        <v-list-item-avatar color="grey darken-3">
          <v-img class="elevation-6" alt="" src="https://avataaars.io/?avatarStyle=Transparent&topType=ShortHairShortCurly&accessoriesType=Prescription02&hairColor=Black&facialHairType=Blank&clotheType=Hoodie&clotheColor=White&eyeType=Default&eyebrowType=DefaultNatural&mouthType=Default&skinColor=Light"></v-img>
        </v-list-item-avatar>
        <v-list-item-content class="py-1">
          <v-list-item-title class="text-left py-1">Evan You</v-list-item-title>
        </v-list-item-content>
        <v-row align="center" justify="end">
          <v-icon class="mr-1"> mdi-dots-horizontal </v-icon>
        </v-row>
      </v-list-item>
    </v-card-title>
    <v-divider />
    <v-card-text class="campus--post-body text-left">
      Lorem ipsum dolor sit amet, mel at clita quando. Te sit oratio vituperatoribus, nam ad ipsum posidonium mediocritatem, explicari dissentiunt cu mea. Repudiare disputationi vim in, mollis iriure nec cu, alienum argumentum ius ad. Pri eu justo aeque torquatos.
    </v-card-text>
    <v-divider />
    <v-card-actions>
      <v-btn text>
        <v-icon left>mdi-thumb-up-outline</v-icon> 297 </v-btn>
      <v-spacer></v-spacer>
    </v-card-actions>
  </v-card>
</template>

<script>
  export default {
    name: 'FeedPost',
  }
</script>

<style>

</style>
