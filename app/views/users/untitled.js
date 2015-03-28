$.ajax({
  url: "http://api.cbssports.com/fantasy/stats?version=3.0&timeframe=2012&period=season&player_id=223571,132668",
  method: "GET",
  dataType: "jsonp",
  success: function(data){
    console.log(data);
  },
  error: function(error){
    console.log(error);
  }
});


$.getJSON("http://api.cbssports.com/fantasy/players/list?version=3.0&response_format=json&SPORT=baseball&callback=?", function(data){ console.log(data) });