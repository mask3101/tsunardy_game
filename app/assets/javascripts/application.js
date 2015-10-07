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

function addInput(divName){
var div1 = document.createElement('div');
var input1 = document.createElement('input');
var label1 = document.createElement('label');
div1.setAttribute('class', 'control-group')
input1.setAttribute('type', 'text');
input1.setAttribute('placeholder', 'Nombre');
input1.setAttribute('name', 'name[]');
input1.setAttribute('id', 'name' + counter);
label1.innerHTML = "Jugador " + counter + " <br/>";
document.getElementById(divName).appendChild(div1);
document.getElementById(divName).appendChild(label1);
document.getElementById(divName).appendChild(input1);
counter++;
}


function visibleDiv(divInvi){
 document.getElementById(divInvi).setAttribute('style', 'display: inline;')
}