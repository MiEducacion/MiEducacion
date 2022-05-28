<template>
  <div class="fill-height">
    <v-app-bar flat color="white" fixed id="site-header">
      <v-spacer/>
      <v-toolbar-title
        @click="goToHome"
        style="cursor: pointer"
        class="mieducacion-default-header--text"
        >Mi<span>Educación</span></v-toolbar-title
      >
      <v-spacer/>
    </v-app-bar>
    <v-main class="mieducacion not-found-page fill-height">
      <v-container fill-height fluid>
        <v-row align="center" justify="center">
          <div class="mieducacion-page-not-found px-4">
            <h1 class="title">Oops!</h1>
            <div class="subtitle py-4">
              Lo sentimos, la página que estabas tratando de cargar no existe.
            </div>
            <v-btn outlined dark @click="goToHome" class="e404 return-to-home my-4"
              >Ir a la página principal</v-btn
            >
            <span class="e404 report-text"
              >Si el problema persiste y piensas que algo está mal, por favor
              <a class="link" href="/reportissue"
                >envíanos un reporte</a
              >
              y lo revisaremos.</span
            >
          </div>
          <img class="mieducacion-404-image" :src="NotFoundImage" />
        </v-row>
      </v-container>
    </v-main>
  </div>
</template>

<script>
import NotFoundImage from "images/illustrations/doggy_notFound.png";

export default {
  name: "NotFound",
  metaInfo: {
    title: "Oops!",
  },
  data() {
    return {
      NotFoundImage,
    };
  },
  methods: {
    goToHome: function () {
      window.location.href = "/";
    },
  },
};
</script>
