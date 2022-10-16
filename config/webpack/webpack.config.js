// config/webpack/webpack.config.js
const path = require('path')
const { webpackConfig, merge } = require('shakapacker')
const vueConfig = require('./rules/vue')
const customConfig = {
    optimization: {
        splitChunks: {
          // include all types of chunks
          chunks: 'all',
        },
      },
    devServer: {
      client: {
        progress: false
      }
    },
    module: {
        rules: [
            {
                test: /\.css$/,
                use: [{ loader: 'style-loader' }, { loader: 'css-loader' }],
            },
        ],
    },
    resolve: {
      alias: {
        '@': path.resolve(__dirname,'..', '..', 'app/assets/javascripts/mieducacion/'),
        'views': path.resolve(__dirname, '..', '..', 'app/assets/javascripts/mieducacion/views/'),
        'components': path.resolve(__dirname, '..', '..', 'app/assets/javascripts/mieducacion/components/'),
        'stylesheets': path.resolve(__dirname, '..', '..', 'app/assets/stylesheets/')
      }
    }
  }


module.exports = merge(vueConfig, customConfig, webpackConfig)