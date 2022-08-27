const AccountPage = () => import('../views/account')

let AccountRoute = {
    name: 'account.index',
    path: '/account',
    component: AccountPage,
    children: [
        {
            name: 'account.summary',
            path: '/account/summary',
        },
        {
            name: 'account.profile',
            path: '/account/profile',
        },
        {
            name: 'account.invites',
            path: '/account/invites',
        },
        {
            name: 'account.notebook',
            path: '/account/notebook',
        }
    ]
 }

 
 export default AccountRoute