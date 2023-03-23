function showPreloaderError() {
  document.getElementById("m-splash").remove()
  const errorDiv = document.createElement("div");
  errorDiv.setAttribute("id", "preload-failed")
  const errorText = document.createTextNode("Unable to boot MiEducación: Essential preloaded data not found");
  errorDiv.appendChild(errorText)
  document.body.appendChild(errorDiv)
}

let preloaded;
const preloadedDataElement = document.getElementById("data-preloaded");

if (preloadedDataElement) {
  preloaded = JSON.parse(preloadedDataElement.dataset.preloaded);
}
else {
  showPreloaderError()
  throw "Unable to boot MiEducación: Essential preloaded data not found";
}


let preloadedData = {
  currentUser: preloaded.currentUser,
  SiteSettings: preloaded.SiteSettings,
  isMobile: preloaded.isMobile
};


export default {
  install: (app) => {
    Object.assign(app.config.globalProperties, preloadedData);
  }
}

export const { SiteSettings, currentUser, isMobile } = preloadedData;

export const Language = {
  current: preloadedData.currentUser?.locale || preloadedData.SiteSettings.default_locale,
  default: preloadedData.SiteSettings.default_locale
}