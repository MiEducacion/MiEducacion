// config/webpack/webpack.config.js
const path = require('path')
const { webpackConfig, merge } = require('shakapacker')
const vueConfig = require('./rules/vue')
const customConfig = {
    devServer: {
      client: {
        progress: false
      }
    },
    resolve: {
      extensions: ['.css', '.scss'],
      alias: {
        '@': path.resolve(__dirname,'..', '..', 'app/assets/javascripts/mieducacion/'),
        'views': path.resolve(__dirname, '..', '..', 'app/assets/javascripts/mieducacion/views/'),
        'components': path.resolve(__dirname, '..', '..', 'app/assets/javascripts/mieducacion/components/')
      }
    }
  }


module.exports = merge(vueConfig, customConfig, webpackConfig)