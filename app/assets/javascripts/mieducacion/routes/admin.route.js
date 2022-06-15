const AdminBase = () => import( /* webpackChunkName: "admin-base" */ '../views/admin/AdminBase.vue');
const AdminDashboard = () => import( /* webpackChunkName: "admin-dashboard" */ '../views/admin/AdminDashboard.vue');
const AdminSettings = () => import( /* webpackChunkName: "admin-settings" */ '../views/admin/AdminSettings.vue');

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
                    component: () => import("../views/admin/settings/GeneralSettings.vue")
                },
                {
                    name: 'admin.settings.customization',
                    path: 'customization',
                    component: () => import("../views/admin/settings/CustomizationSettings.vue")
                },
                {
                    name: 'admin.settings.security',
                    path: 'security',
                    component: () => import("../views/admin/settings/SecuritySettings.vue")
                },
                {
                    name: 'admin.settings.smtp',
                    path: 'smtp',
                    component: () => import("../views/admin/settings/EmailSettings.vue")
                }
            ]
        }
    ],
    meta: {
        requireAdmin: true
    }
}

export default AdminRoutes