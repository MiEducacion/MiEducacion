const CoursesHome = () => import( /* webpackChunkName: "mieducacion-courses-home" */ '../views/CoursesHome.vue')

let CoursesHomeRoute = {
    name: 'CoursesHome',
    path: '/courses',
    component: CoursesHome
 }

 
 export default CoursesHomeRoute