let coreSetup;
const coreSetupElement = document.getElementById("mieducacion-core-setup");
if (coreSetupElement) {
  coreSetup = coreSetupElement.dataset;
}
else {
  throw "Unable to boot MiEducación: Core Setup data not found"
}

export default {
  install: (app) => {
    Object.assign(app.config.globalProperties, GlobalConfig);
  }
}