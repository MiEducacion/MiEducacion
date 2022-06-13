let preloaded;
const preloadedDataElement = document.getElementById("data-preloaded");

if (preloadedDataElement) {
  preloaded = JSON.parse(preloadedDataElement.dataset.preloaded);
}

export default {
    currentUser : preloaded.currentUser,
    SiteSettings : preloaded.SiteSettings,
    isMobile : preloaded.isMobile
};