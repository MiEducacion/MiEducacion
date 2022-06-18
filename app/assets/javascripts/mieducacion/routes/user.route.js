const UserPage = () => import( /* webpackChunkName: "mieducacion-user-page" */ '../views/UserPage.vue')

let UserRoute = {
    name: 'user.redirect',
    path: '/user/:id',
    redirect: '/u/:id',
    children: [
        {
            name: 'user.overview',
            path: '/u/:id',
        },
        {
            name: 'user.profile',
            path: '/u/:id/profile',
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