require_relative "player_data.rb"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

api = CBS_API_Retriever.new

PlayerData.new.players.each do |player|
  p = Player.new
  p.name = player["fullname"]
  p.photo = player["photo"]
  p.cbs_id = player["id"]
  p.save
end

Player.all.each do |player|
  api.make_card(player)
end
 

