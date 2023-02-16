const AdminBase = () => import( /* webpackChunkName: "admin-base" */ '../views/admin/AdminBase.vue');
const AdminDashboard = () => import( /* webpackChunkName: "admin-dashboard" */ '../views/admin/AdminDashboard.vue');
const AdminSettingsLayout = () => import('../views/admin/settings/_layout.vue');

import SettingsView from '../views/admin/settings/SiteSettingsIndex.vue';

import Updater from "../views/admin/updater.vue";


const AdminRoutes = {
    path: '/admin',
    redirect: '/admin/dashboard',
    component: AdminBase,
    children: [
        {
            name: 'admin.dashboard',
            path: 'dashboard',
            component: AdminDashboard,
            meta: {
                requireAdmin: true
            }
        },
        {
            name: 'admin.updates',
            path: 'updates',
            component: Updater,
            meta: {
                requireAdmin: true
            }
        },
        {
            name: 'admin.settings',
            path: 'settings',
            redirect: '/admin/site_settings',
            component: AdminSettingsLayout,
            meta: {
                requireAdmin: true
            },
            children: [
                {
                    name: 'admin.settings.general',
                    path: '/admin/site_settings',
                    component: SettingsView,
                    meta: {
                        requireAdmin: true
                    }
                }
            ]
        }
    ],
    meta: {
        requireAdmin: true
    }
}

export default AdminRoutes