module.exports = {
  purge: {
    content: [
      '../lib/rcd_web/live/**/*.ex',
      '../lib/rcd_web/templates/**/*.eex',
      '../lib/rcd_web/templates/**/*.leex',
      '../lib/rcd_web/views/**/*.ex',
      './js/**/*.js'
    ],
    options: {
      whitelist: ['mode-dark']
    }
  },
  theme: {
    fontFamily: {
      dm: ['dm', 'monospace']
    },
    customForms: theme => ({
      default: {
        checkbox: {
          iconColor: theme('colors.owl-400')
        }
      }
    }),
    extend: {
      colors: {
        red: '#EF5350',
        'dark-red': '#DE3D3B',
        green: '#22DA6E',
        'dark-green': '#08916A',
        blue: '#82AAFF',
        'dark-blue': '#288ED7',
        cyan: '#2AA298',
        'light-cyan': '#21C7A8',
        'owl-100': '#F0F0F0',
        'owl-200': '#D6DEEB',
        'owl-300': '#D3E8F8',
        'owl-400': '#A4AEBE',
        'owl-500': '#5F7777',
        'owl-600': '#4C5862',
        'owl-700': '#13344f',
        'owl-800': '#092034',
        'owl-900': '#011627'
      }
    }
  },
  variants: {
    backgroundColor: ['dark', 'dark-hover', 'dark-group-hover', 'dark-even', 'dark-odd', 'hover'],
    borderColor: ['dark', 'dark-focus', 'dark-focus-within'],
    textColor: ['dark', 'dark-hover', 'dark-active', 'dark-placeholder', 'hover']
  },
  plugins: [
    require('@tailwindcss/ui'),
    require('tailwindcss-dark-mode')()
  ]
}
