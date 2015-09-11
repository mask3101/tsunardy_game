var i = 100;

var counterBack = setInterval(function(){
  i-= 5;
  if(i>=0){
  $('.progress-bar').css('width', i+'%');
  document.getElementById('segundos').innerHTML = Math.floor((i/10)) + ' segundos';
  } else {
    clearTimeout(counterBack);
    document.getElementById('question').submit();
  }

}, 1000);
