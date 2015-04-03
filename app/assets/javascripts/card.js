$(function(){
  $('.player-card').on("click", function(){
    $(this).toggleClass('flipped')
  })
})

$(function(){
  $('.player-card').mouseover(function(){
    var $card = $(this)
    var name = $(this).find("h4").html().split(" ");
    var url = "http://api.giphy.com/v1/gifs/search?q=" + name[0] + "+" + name[1] + "&api_key=dc6zaTOxFJmzC";
    $.getJSON(url, function(data){
      var num = Math.floor(Math.random() * data["data"].length)
      var img = data["data"][num]["images"]["fixed_height_small"]["url"]
      $card.find("img").attr("src", img)
    });
  })
    
  //   // 
  
})
