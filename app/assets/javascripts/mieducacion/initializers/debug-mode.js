import { SiteSettings, currentUser } from '../pre-initializers/essentials-preload'
import i18n from '../lib/i18n';
import { BODY_ELEMENT } from '../helpers/dom-helper';
import { isTouch } from './capabilities';

const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);

const showDebugNotice = () => {
    const d = document.createElement("div");
    d.setAttribute("id", "debug-enabled")
    const dText = document.createTextNode(i18n.methods.t("js.core.debug_enabled"));
    d.appendChild(dText)
    
    BODY_ELEMENT.appendChild(d)
}

export const DEBUG_ENABLED = urlParams.get('debug') === '1';


if (DEBUG_ENABLED) {
    showDebugNotice()
    console.log('[DEBUG] Debug mode is enabled')
    console.log('[DEBUG] 🔧 Current Site Settings')
    console.table(SiteSettings)
    console.log('[DEBUG] 👨‍🦱 Current User')
    console.table(currentUser)
    console.log(`[DEBUG] Touch device: ${isTouch}`)
}

