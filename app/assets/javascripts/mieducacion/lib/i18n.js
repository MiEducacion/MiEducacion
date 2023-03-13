import I18n from 'i18n-js'
require('../i18n/translations')

import { Language } from '../pre-initializers/essentials-preload'

I18n.locale = Language.current
I18n.defaultLocale = Language.default

window.I18n = I18n

export default {
    methods: {
      t: (...args) => I18n.t(...args),
      currentLocale: () => I18n.currentLocale()
    }
  }