let preloaded;
const preloadedDataElement = document.getElementById("data-preloaded");

if (preloadedDataElement) {
  preloaded = JSON.parse(preloadedDataElement.dataset.preloaded);
}
else {
  throw "Unable to boot MiEducación: Essential preloaded data not found";
}


let preloadedData = {
    currentUser : preloaded.currentUser,
    SiteSettings : preloaded.SiteSettings,
    isMobile : preloaded.isMobile
};

export default {
  install: (app) => {
    Object.assign(app.config.globalProperties, preloadedData);
  }
}