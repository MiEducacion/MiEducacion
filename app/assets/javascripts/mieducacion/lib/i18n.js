import I18n from 'i18n-js'
require('../i18n/translations')


I18n.locale = lang.current
I18n.defaultLocale = lang.default

// Remove lang from global variables
delete window.lang

window.I18n = I18n

export default {
    methods: {
      t: (...args) => I18n.t(...args),
      currentLocale: () => I18n.currentLocale()
    }
  }