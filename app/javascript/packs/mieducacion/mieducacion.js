import Vue from 'vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import App from './app.vue'
import router from './routes'
import $ from 'jquery'
import twemoji from 'twemoji'
import Gravatar from 'vue-gravatar';
import VueDirectiveMarkdown from 'vue-directive-markdown'


import SiteSpinner from './common/site-spinner.vue'
import store from './store'

Vue.use(Vuetify)
Vue.component('site-spinner', SiteSpinner)

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
            // return window.location.href = '/404';
        }
        
        // return window.location.href = '/500';
    }
})

window.$ = $;

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