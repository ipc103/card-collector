# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


api = CBS_API_Retriever.new
players = [{"firstname"=>"Andrew","photo"=>"https://www.cbssports.com/images/baseball/mlb/players/170x170/1103290.png","position"=>"CF","icons"=>{"video"=>1,"headline"=>"Pirates' McCutchen has no worries about being ready for start of season"},"lastname"=>"McCutchen","age"=>28,"pro_status"=>"A","jersey"=>"22","fullname"=>"Andrew McCutchen","id"=>"1103290","pro_team"=>"PIT"}]


players.each do |player|
  p = Player.new
  p.name = player["fullname"]
  p.photo = player["photo"]
  p.cbs_id = player["id"]
  p.save
end

Player.all.each do |player|
  api.make_card(player)
end
 

