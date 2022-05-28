const ExceptionView = () => import( /* webpackChunkName: "mieducacion-exception" */ '../views/errors/Exception.vue')


let ExceptionRoute = {
    name: 'Exception',
    path: '/exception',
    component: ExceptionView
 }

 export default ExceptionRoute