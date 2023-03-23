import { createWebHistory, createRouter } from 'vue-router'
import { currentUser, SiteSettings } from '../pre-initializers/essentials-preload'

function loadRoutes() {
    const routes = require.context('./', true, /\.route\.js$/)
    return routes.keys()
      .map(routes)         // import module
      .map(m => m.default)  // get `default` export from each resolved module
  }
  
let routes = loadRoutes()
  
  
  
const router = createRouter({
      history: createWebHistory(),
      routes
  });
  

router.beforeEach((to, from, next) => {

    if (!SiteSettings.public_site && !currentUser && to.path !== '/login-required') {
        next({
            path: '/login-required'
        })
    }


    else if (to.path === '/login-required' && (SiteSettings.public_site || currentUser )) {
        next({
            path: '/'
        })

}


    else if (to.meta.requiresAuth && !currentUser) {
        next({
            name: 'NotFound',
            params: [to.path],
            replace: true
        })

    }

    else if (to.meta.requireAdmin && !currentUser.is_admin || false) {
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
    document.body.setAttribute('data-current-path', to.path);
})

window.AppRouter = router

export default router;