const { VueLoaderPlugin } = require('vue-loader')

module.exports = {
  module: {
    rules: [
      {
        test: /\.vue(\.erb)?$/,
        loader: 'vue-loader'
      }
    ]
  },
  plugins: [new VueLoaderPlugin()],
  resolve: {
    extensions: ['.vue']
  }
}