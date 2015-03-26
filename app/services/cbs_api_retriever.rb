class CBS_API_Retriever
  URL = "http://api.cbssports.com/fantasy/players/list?version=3.0&response_format=json&SPORT=baseball&callback=?"

  attr_reader :response

  def initialize
    @response ||= get_api_data
  end

  def get_api_data
    HTTParty.get(URL)
  end

  def all_players
    self.response.body
  end
end