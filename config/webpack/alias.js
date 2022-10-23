const path = require('path')

module.exports = {
  resolve: {
    alias: {
      '@': path.resolve(__dirname,'..', '..', 'app/assets/javascripts/mieducacion/'),
      'views': path.resolve(__dirname, '..', '..', 'app/assets/javascripts/mieducacion/views/'),
      'components': path.resolve(__dirname, '..', '..', 'app/assets/javascripts/mieducacion/components/'),
      'stylesheets': path.resolve(__dirname, '..', '..', 'app/assets/stylesheets/')
    }
  }
}