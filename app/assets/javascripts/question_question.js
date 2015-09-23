var i = 20;
var j = 20;
var counterBack = setInterval(function(){
  i-= 0.5;
  if(i>=0){
  $('.progress-bar').css('width', ((i / j)*100)+'%');
  document.getElementById('segundos').innerHTML = Math.floor((i/1)) + ' segundos';
  } else {
    clearTimeout(counterBack);
    //document.getElementById('question').submit();
  }

}, 1000);
