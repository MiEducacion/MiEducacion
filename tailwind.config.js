const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascripts/**/*.js',
    './app/assets/javascripts/mieducacion/**/*.vue',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  purge: [
    "./app/**/*.html.erb",
    "./app/javascripts/**/*.vue",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
