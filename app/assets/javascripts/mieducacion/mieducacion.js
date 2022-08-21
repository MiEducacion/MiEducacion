import { createApp } from 'vue'
import App from './app.vue'
import router from './routes/mieducacion-router'
import Gravatar from 'vue-gravatar';
import VueDirectiveMarkdown from 'vue-directive-markdown'
import twemoji from 'twemoji'

import t from './lib/i18n'

const MiEducacion = createApp(App, {

})
MiEducacion.use(router)
MiEducacion.config.globalProperties.$filters = globalFilters
MiEducacion.mixin(t)

require('./lib/axios-setup')
/* require('./lib/register-components')*/
require('./lib/register-service-worker')
require('./lib/report-js-error')

import globalFilters from './helpers/filters'


import SiteSpinner from './components/site-spinner.vue'
import store from './store'

MiEducacion.component('SiteSpinner', SiteSpinner)

MiEducacion.directive('emoji', {
    inserted (el) {
      el.innerHTML = twemoji.parse(el.innerHTML, {  size: 'svg', ext: '.svg'  })
    }
  })
  MiEducacion.directive('md', VueDirectiveMarkdown)
  MiEducacion.component('v-gravatar', Gravatar);

import Preloaded from './lib/preloaded'
Object.assign(MiEducacion.config.globalProperties, Preloaded);

import _ from './lib/lodash'
MiEducacion.config.globalProperties.$_ = _


 /* Remove noscript tag in SPA */
  document.querySelector("noscript")?.remove();



export default MiEducacion

