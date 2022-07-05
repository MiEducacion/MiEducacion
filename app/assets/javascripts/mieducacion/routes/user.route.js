const UserBase = () => import( /* webpackChunkName: "mieducacion-user-page" */ '../views/users/UsersBase.vue')
import UserActivity from '../views/users/UserActivity.vue'

let UserRoute = {
    name: 'user.redirect',
    path: '/user/:id',
    redirect: '/u/:id',
    component: UserBase,
    children: [
        {
            path: '/u/:id',
            redirect: '/u/:id/activity'
        },
        {
            name: 'user.overview.activity',
            path: '/u/:id/activity',
            component: UserActivity
        },
        {
            name: 'user.send-invites',
            path: '/u/:id/send-invites',
        },
        {
            name: 'user.library',
            path: '/u/:id/library',
        }
    ]
 }

 
 export default UserRoute