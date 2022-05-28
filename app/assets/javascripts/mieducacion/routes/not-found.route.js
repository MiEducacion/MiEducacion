const NotFoundView = () => import( /* webpackChunkName: "mieducacion-not-found" */ '../views/errors/NotFound.vue')


let NotFoundRoute = {
    name: 'NotFound',
    path: '*',
    alias: '/not-found',
    component: NotFoundView,
    meta: {
        layout: 'MinimalLayout'
    }
 }


 
 export default NotFoundRoute