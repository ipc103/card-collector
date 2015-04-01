class CBS_API_Retriever
  URL = "http://api.cbssports.com/fantasy/players/list?version=3.0&response_format=json&SPORT=baseball&callback=?"

  attr_reader :response

  def initialize
    # @response ||= get_api_data
  end

  def get_api_data
    HTTParty.get(URL)
  end

  def all_players
    self.response.body
  end

  def make_card(player_name)
    url = "http://api.cbssports.com/fantasy/stats?version=3.0&SPORT=baseball&timeframe=2014&response_format=json&period=season&player_id="
    player = Player.find_by(name: player_name)
    url = url + "#{player.cbs_id}"
    response = HTTParty.get(url)
    data = JSON.parse(response)
    stats = data["body"]["player_stats"]["#{player.cbs_id}"]
    card = Card.new
    card.player = player
    card.year = 2014
    card.batting_avg = stats["BA"]
    card.obp = stats["OBP"]
    card.home_runs = stats["HR"]
    card.rbis = stats["RBI"]
    card.save
  end
end