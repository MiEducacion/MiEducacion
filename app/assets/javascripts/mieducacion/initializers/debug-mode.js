import { SiteSettings, currentUser } from '../pre-initializers/essentials-preload'
import { isTouch } from './capabilities';

const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);

export const DEBUG_ENABLED = urlParams.get('debug') === '1';


if (DEBUG_ENABLED) {
    console.log('[DEBUG] Debug mode is enabled')
    console.log('[DEBUG] 🔧 Current Site Settings')
    console.table(SiteSettings)
    console.log('[DEBUG] 👨‍🦱 Current User')
    console.table(currentUser)
    console.log(`[DEBUG] Touch device: ${isTouch}`)
}

