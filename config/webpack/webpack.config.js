const { webpackConfig, merge } = require('shakapacker')

const vueConfig = require('./loaders/vue')
const aliasConfig = require('./alias')

const customConfig = {
    resolve: {
      extensions: ['.css']
    }
  }
  const options = {
    resolve: {
        extensions: ['.mjs', '.js', '.sass', ".scss", ".css", ".module.sass", ".module.scss", ".module.css", ".png", ".svg", ".gif", ".jpeg", ".jpg"]
    }
  }

module.exports = merge(aliasConfig, vueConfig, customConfig, options, webpackConfig)

