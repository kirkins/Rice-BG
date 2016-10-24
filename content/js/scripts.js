// This script uses require and thus must be compiled using browserify.js
// If you try to run this script directly, it won't work. This is compiled into
// bundle.js in this same directory
var system = require('../system.json');
var html = '<div class="bottom-right">';
html += '<div class="user">'+system.user+'</div>';
html += '<div class="ostype">'+system.ostype+'</div>';
html += '</div>';
document.body.innerHTML += html;
