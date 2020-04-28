module.exports = {
  theme: {
    extend: {
      colors: {},
      textColor: {
        primary: "var(--color-text-primary)",
        secondary: "var(--color-text-secondary)",
        default: "var(--color-text-default)",
        "default-soft": "var(--color-text-default-soft)",
        inverse: "var(--color-text-inverse)",
        "inverse-soft": "var(--color-text-inverse-soft)"
      },
      backgroundColor: {
        primary: "var(--color-bg-primary)",
        secondary: "var(--color-bg-secondary)",
        default: "var(--color-bg-default)",
        inverse: "var(--color-bg-inverse)"
      },
      fontFamily: {
        display: "var(--font-display)",
        body: "var(--font-body)"
      },
      fontWeights: {
        normal: "var(--font-weight-normal)",
        display: "var(--font-weight-display)",
        btn: "var(--font-weight-btn)"
      },
      borderRadius: {
        none: "0",
        btn: "var(--rounded-btn)"
      },
    }
  },
  corePlugins: {
    gap: false,
    gridAutoFlow: false,
    gridColumn: false,
    gridColumnStart: false,
    gridColumnEnd: false,
    gridRow: false,
    gridRowStart: false,
    gridRowEnd: false,
    gridTemplateColumns: false,
    gridTemplateRows: false
  },
  variants: {},
  plugins: [
    require('@tailwindcss/ui'),
  ]
}
