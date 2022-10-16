import { 
    UploadCloud,
    User,
    LogOut,
    Wrench,
    Smile,
    Plus
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
    },
    {
        name: 'SmileIcon',
        component: Smile
    },
    {
        name: 'PlusIcon',
        component: Plus
    }
]

export default {
    install: (app) => {
        ICON_MAP.map(function(iconComponent) {
            app.component(iconComponent.name, iconComponent.component)
        })        
    }
}