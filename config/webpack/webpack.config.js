// config/webpack/webpack.config.js
const path = require('path')
const { webpackConfig, merge } = require('shakapacker')
const vueConfig = require('./rules/vue')
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

const customConfig = {
  entry: {
    "mieducacion": 'stylesheets/mieducacion.scss',
    "admin": 'stylesheets/admin.scss'
  },
    optimization: {
        splitChunks: {
          // include all types of chunks
          chunks: 'all',
        },
      },
    module: {
      rules: [
        {
          test: /\.scss$/,
          use: [
            // fallback to style-loader in development
            process.env.NODE_ENV !== 'production'
              ? 'style-loader'
              : MiniCssExtractPlugin.loader,
            'css-loader',
            'sass-loader',
          ],
        },
      ],
    },
    plugins: [
      new MiniCssExtractPlugin({
        filename: '[name].css',
      }),
    ],
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