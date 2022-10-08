import I18n from 'i18n-js'
require('../i18n/translations')

window.I18n = I18n

export default {
    methods: {
      t: (...args) => I18n.t(...args),
      currentLocale: () => I18n.currentLocale()
    }
  }