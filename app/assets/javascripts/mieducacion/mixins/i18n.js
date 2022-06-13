export default {
    methods: {
      t: (...args) => I18n.t(...args),
      currentLocale: () => I18n.currentLocale()
    }
  }