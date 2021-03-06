window.theme = {
  mode: 'dark',
  setMode () {
    this.mode = window.localStorage.getItem('theme') || this.mode
    this.updateDocument()

    return this.mode
  },
  toggle () {
    // toggle the current mode
    this.mode = this.mode === 'dark'
      ? 'light'
      : 'dark'
    // Enable theme transitions after the initial theme mode has been set.
    document.body.classList.add('transition', 'ease-in-out', 'duration-500')

    // update local storage
    this.save()
    // update the theme class on the document root
    this.updateDocument()

    return this.mode
  },
  save () {
    window.localStorage.setItem('theme', this.mode)
  },
  updateDocument () {
    document.documentElement.classList.remove('mode-dark')

    if (this.mode === 'dark') {
      document.documentElement.classList.add('mode-dark')
    }
  }
}

window.theme.setMode()
