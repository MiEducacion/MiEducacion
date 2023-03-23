import WizardComponent from '../views/wizard/components/wizard-step.vue';

let WizardRoute = {
    path: '/wizard', component: WizardComponent, children: [
        { path: '', redirect: '/wizard/steps/welcome' },
        {
            name: 'wizard.welcome',
            path: 'steps/welcome'
        }
    ]
}

export default WizardRoute