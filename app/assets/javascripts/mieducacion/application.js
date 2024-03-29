import { createApp } from 'vue/dist/vue.esm-bundler'
import App from './app.vue'
import CoreSetup from './pre-initializers/core-setup';
import EssentialsPreloaded from './pre-initializers/essentials-preload';
import router from './routes/mieducacion-router'
import Markdown from './plugins/markdown';
import reportJsError from './lib/report-js-error'
import globalFilters from './helpers/filters'
import i18n from './lib/i18n'
import _ from './lib/lodash'
import MSpinner from './components/m-spinner.js'
import twemoji from './plugins/twemoji';
import metaManager from './plugins/metaManager';
import mIcons from './plugins/m-icons';
import pinia from './plugins/pinia';
import Notifier from './lib/m-notifier';
import ColorPicker from './plugins/color-picker';
import "../../builds/mieducacion-wind.css"
require('./initializers/require-libs.js')
require('./lib/site-customizations.js')



const MiEducacion = createApp(App)
MiEducacion.$Site = {}

let pluginsMap = [
  CoreSetup,
  pinia,
  EssentialsPreloaded,
  router,
  reportJsError,
  metaManager,
  twemoji,
  Markdown,
  mIcons,
  Notifier,
  ColorPicker
]


pluginsMap.map(function(plugin) {
  MiEducacion.use(plugin)
})

MiEducacion.mixin(i18n)

MiEducacion.config.globalProperties.$filters = globalFilters
MiEducacion.config.globalProperties.$_ = _

MiEducacion.component('MSpinner', MSpinner)

 /* Remove noscript tag in SPA */
document.querySelector("noscript")?.remove();

MessageBus.start();

export default MiEducacion