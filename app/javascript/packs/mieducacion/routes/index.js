import Vue from "vue";
import VueRouter from 'vue-router'
import Meta from 'vue-meta'


import Home from "../views/home";
import NotFound from '../views/errors/404'
const UserLogin = () =>
  import(/* webpackChunkName: "user-login" */ '../views/auth/Login')

Vue.use(VueRouter)
Vue.use(Meta)

const routes = [
    {
        path: '/',
        name: "home",
        component: Home,
        meta: {
          layout: 'ApplicationLayout'
        }
    },
    {
        path: '/courses',
        name: 'Courses',
        meta: {
          layout: 'ApplicationLayout'
        }
    },
    {
        path: '/auth/login',
        name: 'Login',
        component: UserLogin,
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
    if (window.MiniProfiler !== undefined) {
        window.MiniProfiler.pageTransition();
        next()
      }
    else next()
  })

export default router;