const path = require('path');
const { webpackConfig, merge, loaders } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')


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
    new VueLoaderPlugin(),
    new MiniCssExtractPlugin()
  ],
  resolve: {
    extensions: ['.css', '.scss', '.vue'],
    alias: {
      vue: 'vue/dist/vue.esm-bundler',
      '@': path.resolve(__dirname,'..', '..', 'app/assets/javascripts/mieducacion/'),
      'views': path.resolve(__dirname, '..', '..', 'app/assets/javascripts/mieducacion/views/'),
      'components': path.resolve(__dirname, '..', '..', 'app/assets/javascripts/mieducacion/components/')
    }
  }
}, webpackConfig)