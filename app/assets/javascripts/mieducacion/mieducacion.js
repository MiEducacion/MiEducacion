import { createApp } from 'vue'
import App from './app.vue'
import router from './routes/mieducacion-router'
import { createMetaManager } from 'vue-meta'
import MarkdownParser from './lib/markdown-it';
import twemoji from 'twemoji'
import Preloaded from './lib/preloaded'
import reportJsError from './lib/report-js-error'
import globalFilters from './helpers/filters'
import t from './lib/i18n'
import _ from './lib/lodash'
import "./stylesheets/mieducacion.scss"
import SiteSpinner from './components/site-spinner.vue'


require('./lib/axios-setup')
require('./lib/register-service-worker')

const metaManager = createMetaManager()

const MiEducacion = createApp(App)
MiEducacion.use(router)
           .use(Preloaded)
           .use(reportJsError)
           .use(metaManager)
           .mixin(t)

MiEducacion.config.globalProperties.$filters = globalFilters
MiEducacion.config.globalProperties.$_ = _
MiEducacion.component('SiteSpinner', SiteSpinner)
MiEducacion.directive('emoji', {
    mounted (el) {
      el.innerHTML = twemoji.parse(el.innerHTML, {  size: 'svg', ext: '.svg'  })
    }
  })
MiEducacion.directive('md', {
    mounted (el) {
      el.innerHTML = MarkdownParser.render(el.innerHTML)
    }
})

 /* Remove noscript tag in SPA */
document.querySelector("noscript")?.remove();


export default MiEducacion