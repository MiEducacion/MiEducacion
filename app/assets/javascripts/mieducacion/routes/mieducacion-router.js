const SiteSettings = window.MiEducacion.SiteSettings
const user = window.MiEducacion.currentUser

import Vue from "vue";
import VueRouter from 'vue-router'
import Meta from 'vue-meta'


Vue.use(VueRouter)
Vue.use(Meta)

function loadRoutes() {
    const routes = require.context('./', true, /\.route\.js$/)
    return routes.keys()
      .map(routes)         // import module
      .map(m => m.default)  // get `default` export from each resolved module
  }
  
  let routes = loadRoutes()
  
  
  
  const router = new VueRouter({
      mode: "history",
      routes
  });
  

router.beforeEach((to, from, next) => {
    if (!SiteSettings.public_site && !user && to.path !== '/login-required') {
        next({
            path: '/login-required'
        })
    }


    else if (to.path === '/login-required' && (SiteSettings.public_site || user )) {
        next({
            path: '/'
        })

}


    else if (to.meta.requiresAuth && !user) {
        next({
            name: 'NotFound',
            params: [to.path],
            replace: true
        })

    }

    else if (to.meta.requireAdmin && !user.is_admin) {
        next({
            name: 'NotFound',
            params: [to.path],
            replace: true
        })

    }
    else next()
})

router.afterEach((to, from) => {
    if (window.MiniProfiler && from) {
        window.MiniProfiler.pageTransition();
    }
})

window.AppRouter = router

export default router;