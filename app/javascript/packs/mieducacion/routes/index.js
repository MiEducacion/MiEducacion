import Vue from "vue";
import VueRouter from 'vue-router'
import Meta from 'vue-meta'


import Home from "../views/home";
import NotFound from '../views/errors/404'
const Courses = () => import(/* webpackChunkName: "site-courses" */ '../views/courses')
const UserLogin = () =>
  import(/* webpackChunkName: "user-login" */ '../views/auth/Login')

Vue.use(VueRouter)
Vue.use(Meta)

const routes = [
    { path: '/', name: "home", component: Home, alias: '/home'},
    {
        path: '/courses',
        name: 'Courses',
        component: Courses

    },
    {
        path: '/my',
        redirect: '/my/summary'
    },
    {
        path: '/my/summary',
        name: 'MySummary'
    },
    {
        path: '/my/profile',
        name: 'MyProfile'
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

router.beforeResolve((to, from, next) => {
    if (window.MiniProfiler !== undefined) {
        window.MiniProfiler.pageTransition();
        next()
      }
    else next()
  })

export default router;