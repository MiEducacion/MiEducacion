import { createApp } from 'vue'
import App from './app.vue'
import router from './routes/mieducacion-router'
import Gravatar from 'vue-gravatar';
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


const MiEducacion = createApp(App)
MiEducacion.use(router)
           .use(Preloaded)
           .use(reportJsError)
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
MiEducacion.component('v-gravatar', Gravatar);

 /* Remove noscript tag in SPA */
document.querySelector("noscript")?.remove();


export default MiEducacion