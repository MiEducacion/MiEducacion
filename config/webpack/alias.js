const path = require('path')

module.exports = {
  resolve: {
    alias: {
      '@': path.resolve(__dirname,'..', '..', 'app/assets/javascripts/mieducacion/'),
      'views': path.resolve(__dirname, '..', '..', 'app/assets/javascripts/mieducacion/views/'),
      'components': path.resolve(__dirname, '..', '..', 'app/assets/javascripts/mieducacion/components/'),
      'mieducacion': path.resolve(__dirname, '..', '..', 'app/assets/javascripts/mieducacion/'),
      'mieducacion-utils': path.resolve(__dirname, '..', '..', 'app/assets/javascripts/mieducacion/helpers'),
    }
  }
}