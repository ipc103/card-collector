require 'open-uri'
class CBS_API_Retriever
  URL = "http://api.cbssports.com/fantasy/players/list?version=3.0&response_format=json&SPORT=baseball&callback=?"

  def get_api_data
    open(URL).read
  end

  def parse_players
    null = nil
    JSON.parse(get_api_data)
  end

  def all_players
    self.response.body
  end

  def save_card(player, year, avg, obp, hr, rbi)
    Card.create(player: player, year: year, batting_avg: avg, obp: obp, home_runs: hr, rbis: rbi)
  end

  def get_player_stats(api_id)
    url = "http://api.cbssports.com/fantasy/stats?version=3.0&SPORT=baseball&timeframe=2014&response_format=json&period=season&player_id=#{player.cbs_id}"
    JSON.parse(HTTParty.get(url))
  end

  def make_card(player_name)
    player = Player.find_by(name: player_name)
    stats = get_player_stats(player.cbs_id)["body"]["player_stats"]["#{player.cbs_id}"]
    save_card(player, 2014, stats["BA"], stats["OBP"], stats["HR"], stats["RBI"])
  end
end