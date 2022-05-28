import Vue from 'vue'
import Vuetify from 'vuetify'
import App from './app.vue'
import router from './routes/mieducacion-router'
import $ from 'jquery'
import twemoji from 'twemoji'
import Gravatar from 'vue-gravatar';
import VueDirectiveMarkdown from 'vue-directive-markdown'

import I18n from 'i18n-js'
window.I18n = I18n



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



$.ajaxSetup({
    timeout: 10000,
    beforeSend: function (xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
    },
    complete: function (xhr, status) {
        if (xhr.status === 200 || xhr.status === 422) {
            return true;
        }
        if (xhr.status === 404) {
            AppRouter.replace('/not-found')
        }
        if (xhr.status === 500 || xhr.status === 502) {
            AppRouter.replace('/exception')
        }
    }
})

window.$ = $;
Vue.prototype.currentUser = window.MiEducacion.currentUser;
Vue.prototype.SiteSettings = window.MiEducacion.SiteSettings;
Vue.prototype.isMobile = window.MiEducacion.mobile;



document.addEventListener('DOMContentLoaded', () => {
    const app = new Vue({
        el: '#mieducacion',
        vuetify: new Vuetify(),
        router,
        store,
        render: h => h(App)
    }).$mount()
    document.body.appendChild(app.$el)
})