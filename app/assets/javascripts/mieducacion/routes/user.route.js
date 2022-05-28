const UserPage = () => import( /* webpackChunkName: "mieducacion-user-page" */ '../views/UserPage.vue')

let UserRoute = {
    name: 'UserPage',
    path: '/user/:id',
    component: UserPage
 }

 
 export default UserRoute