var system = require('../system.json');
console.log(system);
console.log(system.user);
document.body.innerHTML += '<div class="user">'+system.user+'</div>';
document.body.innerHTML += '<div class="ostype">'+system.ostype+'</div>';
