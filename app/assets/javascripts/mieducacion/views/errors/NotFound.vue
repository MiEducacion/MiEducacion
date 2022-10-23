<template>
  <div class="fill-height">
    <div id="error" class="not-found-page fill-height">
      <div class="flex justify-center items-center fill-height">
          <div class="mieducacion-page-not-found px-4">
            <h1 class="title">Oops!</h1>
            <div class="subtitle py-4">
              Lo sentimos, la página que estabas tratando de cargar no existe.
            </div>
            <a href="/" class="e404 return-to-home my-4"
              >Ir a la página principal</a>
            <span class="e404 report-text"
              >Si el problema persiste y piensas que algo está mal, por favor
              <a class="link" href="/report-issue"
                >envíanos un reporte</a
              >
              y lo revisaremos.</span
            >
          </div>
          <img class="mieducacion-404-image flex" :src="NotFoundImage" />
      </div>
    </div>
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
};
</script>
