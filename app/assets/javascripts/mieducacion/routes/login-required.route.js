import LoginRequired from '../views/errors/LoginRequired'

const LoginRequiredRoute = {
    path: '/login-required',
    name: 'LoginRequired',
    component: LoginRequired,
    meta: {
        layout: 'MinimalLayout'
    }
}

export default LoginRequiredRoute