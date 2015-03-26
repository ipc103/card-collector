$(function(){

  $('.player-card').on("click", function(event){
    event.stopPropagation();
    $(this).toggleClass('flipped')
  })
})