const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const aliasConfig = require('./alias')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.config.merge(aliasConfig)
environment.loaders.prepend('vue', vue)

module.exports = environment
