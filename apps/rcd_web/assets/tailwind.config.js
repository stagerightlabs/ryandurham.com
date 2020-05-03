module.exports = {
  purge: [
    '../lib/rcd_web/live/**/*.ex',
    '../lib/rcd_web/templates/**/*.eex',
    '../lib/rcd_web/templates/**/*.leex',
    '../lib/rcd_web/views/**/*.ex',
    './js/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        'gray-100': 'var(--color-gray-100)',
        'gray-400': 'var(--color-gray-400)',
        'gray-500': 'var(--color-gray-500)',
        blue: 'var(--color-blue)',
        cyan: 'var(--color-cyan)',
        red: 'var(--color-red)'
      },
      textColor: {
        primary: 'var(--color-gray-200)',
        default: 'var(--color-gray-400)'
      },
      backgroundColor: {
        500: 'var(--color-background-500)',
        700: 'var(--color-background-700)',
        900: 'var(--color-background-900)'
      },
      fontFamily: {
        display: 'var(--font-display)',
        body: 'var(--font-body)'
      },
      fontWeights: {
        normal: 'var(--font-weight-normal)',
        display: 'var(--font-weight-display)',
        btn: 'var(--font-weight-btn)'
      }
    }
  },
  variants: {},
  plugins: [
    require('@tailwindcss/ui')
  ]
}
