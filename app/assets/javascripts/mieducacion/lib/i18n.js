import Vue from 'vue'
import I18n from 'i18n-js'

require('../i18n/translations')

window.I18n = I18n

import t from '../mixins/i18n'
Vue.mixin(t)