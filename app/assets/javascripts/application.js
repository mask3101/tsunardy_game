// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap


var counter = 1;
var limit = 9;
function addInput(divName){
     if (counter == limit)  {
        var current = "user_" + (counter - 1)
          alert("You have reached the limit of adding " + current + " inputs");
     }
     else {
          var newdiv = document.createElement('div');
          newdiv.innerHTML = "Jugador " + counter + " <br><input type='text' name='user_"+ counter +"'>";
          document.getElementById(divName).appendChild(newdiv);
          counter++;
     }
}