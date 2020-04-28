// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
/* eslint-disable no-unused-vars */
import css from '../css/app.css'
import dm from '../css/dank-mono.css'
/* eslint-enable no-unused-vars */

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import 'phoenix_html'
import 'alpinejs'

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
import './theme.js'
