const SiteSettings = window.MiEducacion.SiteSettings
const currentUser = window.MiEducacion.currentUser

import Vue from "vue";
import VueRouter from 'vue-router'
import Meta from 'vue-meta'


import Home from "../views/home";
import NotFound from '../views/errors/404'
import LoginRequired from '../views/errors/LoginRequired'

const Courses = () => import( /* webpackChunkName: "site-courses" */ '../views/courses')
const MyProfile = () => import( /* webpackChunkName: "my-profile" */ '../views/users/my')


Vue.use(VueRouter)
Vue.use(Meta)

const routes = [{
        path: '/',
        name: "home",
        component: Home,
        alias: '/home'
    },
    {
        path: '/courses',
        name: 'Courses',
        component: Courses

    },
    {
        path: '/my',
        redirect: '/my/profile'
    },
    {
        path: '/my/profile',
        name: 'MyProfile',
        component: MyProfile,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/login-required',
        name: 'LoginRequired',
        component: LoginRequired,
        meta: {
            layout: 'MinimalLayout'
        }
    },
    {
        path: '*',
        name: 'NotFound',
        errorCode: 404,
        component: NotFound,
        meta: {
            layout: 'MinimalLayout'
        }
    },
];

const router = new VueRouter({
    mode: "history",
    routes
});


router.beforeEach((to, from, next) => {
    if (SiteSettings.public_site == false && !currentUser && to.path !== '/login-required') {
        next({
            path: '/login-required'
        })
    }
    else if (to.meta.requiresAuth && !currentUser) {
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

export default router;