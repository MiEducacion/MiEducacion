const HomeDashboard = () => import( /* webpackChunkName: "mieducacion-home-dashboard" */ '../views/HomeDashboard.vue')

let HomeRoute = {
    name: 'HomeDashboard',
    path: '/',
    alias: '/home',
    component: HomeDashboard
 }

 
 export default HomeRoute