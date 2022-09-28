import { createApp } from 'vue'
import App from './app.vue'
import router from './routes/mieducacion-router'
import { createMetaManager } from 'vue-meta'
import Markdown from './plugins/markdown';
import coreSetup from './lib/core-setup';
import Preloaded from './lib/preloaded'
import reportJsError from './lib/report-js-error'
import globalFilters from './helpers/filters'
import t from './lib/i18n'
import _ from './lib/lodash'
import "./stylesheets/mieducacion.scss"
import MSpinner from './components/m-spinner.js'
import twemoji from './plugins/twemoji';

require('./lib/axios-setup')
require('./lib/register-service-worker')

const metaManager = createMetaManager()

const MiEducacion = createApp(App)

let pluginsMap = [
  coreSetup,
  Preloaded,
  router,
  reportJsError,
  metaManager,
  twemoji,
  Markdown
]

pluginsMap.map(function(plugin) {
  MiEducacion.use(plugin)
})


MiEducacion.mixin(t)

MiEducacion.config.globalProperties.$filters = globalFilters
MiEducacion.config.globalProperties.$_ = _
MiEducacion.component('MSpinner', MSpinner)

 /* Remove noscript tag in SPA */
document.querySelector("noscript")?.remove();


export default MiEducacion