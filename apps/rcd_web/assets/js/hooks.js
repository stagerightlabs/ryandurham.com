const hooks = {
  AuthorMultiSelect: {
    mounted () {
      console.log('mounted')
      this.el.addEventListener('keydown', e => {
        // Listen for blur events and alert the live view component.
        // There is probably a better way to do this.
        if (e.key === 'Tab') {
          this.pushEvent('blur', {})
        }
      })
      // Disable form submission via the enter key when this el has focus
      this.el.form.addEventListener('keypress', e => {
        if (e.key === 'Enter' && e.target.matches('#author-multi-select-input')) {
          console.log('form submission blocked')
          e.preventDefault()
        }
      })
    },

    destroyed () {
      this.el.removeEventListener('keyup')
      this.el.form.removeEventListener('keypress')
    },

    updated () {
      // console.log('updated')
    }
  }
}

export default hooks
