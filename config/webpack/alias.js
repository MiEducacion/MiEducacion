const path = require('path')

module.exports = {
  resolve: {
    alias: {
      '@': path.resolve(__dirname, '..', '..', 'app/assets/javascripts/mieducacion/src'),
      '@views': path.resolve(__dirname, '..', '..', 'app/assets/javascripts/mieducacion/src/views')
    }
  }
}