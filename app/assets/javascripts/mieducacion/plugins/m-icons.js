import { 
    UploadCloud,
    User,
    LogOut,
    Wrench
} from "lucide-vue-next"

/* There is probably a better way to register the icons */

let ICON_MAP = [
    {
        name: 'UploadCloud',
        component: UploadCloud
    },
    {
        name: 'UserIcon',
        component: User
    },
    {
        name: 'LogOut',
        component: LogOut
    },
    {
        name: 'Wrench',
        component: Wrench
    }
]

export default {
    install: (app) => {
        ICON_MAP.map(function(iconComponent) {
            app.component(iconComponent.name, iconComponent.component)
        })        
    }
}