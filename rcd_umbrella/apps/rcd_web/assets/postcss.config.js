const purgecss = require('@fullhuman/postcss-purgecss')({

  // Specify the paths to all of the template files in your project
  content: [
    '../lib/rcd_web/live/**/*.ex',
    '../lib/rcd_web/templates/**/*.eex',
    '../lib/rcd_web/templates/**/*.leex',
    '../lib/rcd_web/views/**/*.ex',
  ],

  // Include any special characters you're using in this regular expression
  defaultExtractor: content => content.match(/[\w-/:]+(?<!:)/g) || []
})



module.exports = {
  plugins: [
    require('tailwindcss'),
    require('autoprefixer'),
    ...process.env.NODE_ENV === 'production'
      ? [purgecss]
      : []
  ]
};
