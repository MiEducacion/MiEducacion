const AdminBase = () => import( /* webpackChunkName: "admin-base" */ '../views/admin/AdminBase.vue');
const AdminDashboard = () => import( /* webpackChunkName: "admin-dashboard" */ '../views/admin/AdminDashboard.vue');
const AdminSettings = () => import( /* webpackChunkName: "admin-settings" */ '../views/admin/AdminSettings.vue');

import GeneralSettings from '../views/admin/settings/GeneralSettings.vue';
import CustomizationSettings from "../views/admin/settings/CustomizationSettings.vue";
import SecuritySettings from "../views/admin/settings/SecuritySettings.vue";
import EmailSettings from "../views/admin/settings/EmailSettings.vue";


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
            name: 'admin.settings',
            path: 'settings',
            component: AdminSettings,
            meta: {
                requireAdmin: true
            },
            children: [
                {   
                    alias: '',
                    name: 'admin.settings.general',
                    path: 'general_settings',
                    component: GeneralSettings,
                    meta: {
                        requireAdmin: true
                    }
                },
                {
                    name: 'admin.settings.customization',
                    path: 'customization',
                    component: CustomizationSettings,
                    meta: {
                        requireAdmin: true
                    }
                },
                {
                    name: 'admin.settings.security',
                    path: 'security',
                    component: SecuritySettings,
                    meta: {
                        requireAdmin: true
                    }
                },
                {
                    name: 'admin.settings.smtp',
                    path: 'smtp',
                    component: EmailSettings,
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