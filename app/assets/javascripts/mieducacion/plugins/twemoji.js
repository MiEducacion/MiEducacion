import twemoji from 'twemoji'

export default {
    install: (app) => {
        app.directive('emoji', {
            mounted(el) {
                el.innerHTML = twemoji.parse(el.innerHTML, {
                    size: 'svg',
                    ext: '.svg',
                    base: app.$Site.twemoji_cdn
                })
            }
        })
    }
}