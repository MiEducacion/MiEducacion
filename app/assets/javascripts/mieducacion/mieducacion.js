import Vue from 'vue'
import Vuetify from 'vuetify'
import App from './app.vue'
import router from './routes/mieducacion-router'
import Gravatar from 'vue-gravatar';
import VueDirectiveMarkdown from 'vue-directive-markdown'
import twemoji from 'twemoji'

require('./lib/axios-setup')
require('./lib/i18n')
/* require('./lib/register-components')*/
require('./lib/register-service-worker')
require('./lib/report-js-error')
require('./filters/truncate')


import SiteSpinner from './components/site-spinner.vue'
import store from './store'

Vue.use(Vuetify)
Vue.component('SiteSpinner', SiteSpinner)

Vue.directive('emoji', {
    inserted (el) {
      el.innerHTML = twemoji.parse(el.innerHTML, {  size: 'svg', ext: '.svg'  })
    }
  })
Vue.directive('md', VueDirectiveMarkdown)
Vue.component('v-gravatar', Gravatar);

import Preloaded from './lib/preloaded'
Object.assign(Vue.prototype, Preloaded);

import _ from './lib/lodash'
Vue.prototype.$_ = _


 /* Remove noscript tag in SPA */
  document.querySelector("noscript")?.remove();

  const MiEducacion = new Vue({
        el: '#mieducacion',
        vuetify: new Vuetify(),
        router,
        store,
        render: h => h(App)
    })

export default MiEducacion

