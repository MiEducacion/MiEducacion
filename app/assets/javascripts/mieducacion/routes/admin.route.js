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
            }
        }
    ],
    meta: {
        requireAdmin: true
    }
}

export default AdminRoutes