$(function(){
  $('.player-card').on("click", function(){
    $(this).toggleClass('flipped')
  })

  $('#card-list').sortable();
})

$(function(){
  $('.player-card img').click(function(e){
    e.stopPropagation();
    var $img = $(this)
    var name = $(this).parent().find("h4").html().split(" ");
    var url = "http://api.giphy.com/v1/gifs/search?q=" + name[0] + "+" + name[1] + "&api_key=dc6zaTOxFJmzC";
    $.getJSON(url, function(data){
      var img = ""
      while (img === "") {
        var num = Math.floor(Math.random() * data["data"].length);
        img = data["data"][num]["images"]["fixed_height_small"]["url"];
      };
      $img.attr("src", img)
    });
  })  
})




