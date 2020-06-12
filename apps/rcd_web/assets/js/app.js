// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
/* eslint-disable no-unused-vars */
import css from '../css/app.css'
import dm from '../css/dank-mono.css'
import socket from './socket'
/* eslint-enable no-unused-vars */

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import 'phoenix_html'
import { Socket } from 'phoenix'
import LiveSocket from 'phoenix_live_view'
import 'alpinejs'

// Import local files
import './theme.js'
import hooks from './hooks'

// LiveView sockets
const csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute('content')
const liveSocket = new LiveSocket('/live', Socket, {
  hooks: hooks,
  params: {
    _csrf_token: csrfToken
  }
})

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enabledDebug()
// >> liveSocket.enableLatencySim(1000)
window.liveSocket = liveSocket
