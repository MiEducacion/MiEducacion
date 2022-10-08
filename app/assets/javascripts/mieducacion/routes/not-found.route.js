import NotFoundView from 'views/errors/NotFound.vue'


let NotFoundRoute = {
    name: 'NotFound',
    path: '/:pathMatch(.*)*',
    alias: '/not-found',
    component: NotFoundView,
    meta: {
        layout: 'MinimalLayout'
    }
 }


 
 export default NotFoundRoute