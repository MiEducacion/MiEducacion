const path = require('path');
const { webpackConfig, merge } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')

module.exports = merge({
  module: {
    rules: [
      {
        test: /\.vue$/,
        loader: 'vue-loader'
      }
    ]
  },
  plugins: [
    new VueLoaderPlugin()
  ],
  resolve: {
    extensions: ['.css', '.vue'],
    alias: {
      vue: 'vue/dist/vue.esm-bundler',
      '@': path.resolve(__dirname,'..', '..', 'app/assets/javascripts/mieducacion/'),
      'views': path.resolve(__dirname, '..', '..', 'app/assets/javascripts/mieducacion/views/'),
      'components': path.resolve(__dirname, '..', '..', 'app/assets/javascripts/mieducacion/components/')
    }
  }
}, webpackConfig)