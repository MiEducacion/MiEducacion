let coreSetup;
const coreSetupElement = document.getElementById("mieducacion-core-setup");
if (coreSetupElement) {
  coreSetup = coreSetupElement.dataset;
}
else {
  throw "Unable to boot MiEducación: Core Setup data not found"
}

let GlobalConfig = {
  enableReportToLogster: coreSetup.enableReportToLogster
}

export default {
  install: (app) => {
    Object.assign(app.$Site, GlobalConfig);
    Object.freeze(app.$Site)
  }
}