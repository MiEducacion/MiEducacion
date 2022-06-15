<template>
  <v-card outlined class="mx-2 mb-6 post-card">
    <v-card-title class="py-1">
      <v-list-item class="grow">
        <v-list-item-avatar color="grey darken-3">
          <v-img class="elevation-6" alt="" src="https://avataaars.io/?avatarStyle=Transparent&topType=ShortHairShortCurly&accessoriesType=Prescription02&hairColor=Black&facialHairType=Blank&clotheType=Hoodie&clotheColor=White&eyeType=Default&eyebrowType=DefaultNatural&mouthType=Default&skinColor=Light"></v-img>
        </v-list-item-avatar>
        <v-list-item-content class="post-metadata">
          <v-list-item-title class="text-left author name">Evan You</v-list-item-title>
          <v-list-item-subtitle class="text-left post posted-at">23:56</v-list-item-subtitle>
        </v-list-item-content>
        <v-row align="center" justify="end">
          <v-icon class="mr-1"> mdi-dots-vertical </v-icon>
        </v-row>
      </v-list-item>
    </v-card-title>
    <v-card-text class="campus--post-body text-left">
      Lorem ipsum dolor sit amet, mel at clita quando. Te sit oratio vituperatoribus, nam ad ipsum posidonium mediocritatem, explicari dissentiunt cu mea. Repudiare disputationi vim in, mollis iriure nec cu, alienum argumentum ius ad. Pri eu justo aeque torquatos.
    </v-card-text>
    <v-divider />
    <v-card-actions :class="isMobile ? '' : 'px-5'">
      <v-col cols="12">
          <v-textarea
            outlined
            auto-grow
            class="post-comment"
            rows="1"
            rounded
            dense
            hide-details
            label="Add a comment"
            type="text"
          >
            <template v-if="currentUser" v-slot:prepend>
               <v-avatar size="32">
        <v-gravatar :email="currentUser.email" alt="User Avatar" :size="120" class="avatar" />
      </v-avatar>
            </template>
          </v-textarea>
        </v-col>
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
