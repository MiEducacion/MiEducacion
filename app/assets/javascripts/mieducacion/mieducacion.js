import Vue from 'vue'
import Vuetify from 'vuetify'
import App from './app.vue'
import router from './routes/mieducacion-router'
import Gravatar from 'vue-gravatar';
import VueDirectiveMarkdown from 'vue-directive-markdown'

require('./lib/ajax-setup')
require('./lib/i18n')
require('./lib/register-components')
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

