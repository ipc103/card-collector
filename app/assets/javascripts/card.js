$(function(){
  $('.player-card').on("click", function(){
    $(this).toggleClass('flipped')
  })
})

$(function(){
  $('.player-card').on("mouseenter", function(){
      debugger;
     $(this).parent.width($(this).parent.width() + 30);  })
  
})
