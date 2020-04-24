// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"
import dm from "../css/dank-mono.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

// Toggle Dark Theme
// var d = document.documentElement,
//     t = document.querySelectorAll(".theme-btn")[0],
//     m = localStorage.getItem("theme");

// if(m == "dark" || !m) {
//   d.classList.add("theme-dark");
// }

// if (t) {
//   t.addEventListener("click", function(){
//     if(d.classList.contains("theme-dark")) {
//       d.classList.remove("theme-dark");
//       localStorage.setItem("theme", "light");
//     } else {
//       d.classList.add("theme-dark");
//       localStorage.setItem("theme", "dark");
//     }
//   });
// }
