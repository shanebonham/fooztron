# class Team
# 
#   attr_accessor :offense, :defense
# 
#   def initialize(attrs = {})
#     attrs.each do |k,v|
#       self.send "#{k}=", v
#     end
#   end
# 
#   def self.all
#     games = Game.all
#     teams = []
#     teams_array = []
#     games.each do |game|
#       white_team = {}
#       blue_team = {}
#       white_team_offense = {}
#       white_team_defense = {}
#       blue_team_offense = {}
#       blue_team_defense = {}
#       game.played_positions.each do |played_position|
#         case played_position.position
#         when :white_offense
#           white_team_offense = {:offense => played_position.player}
#         when :white_defense
#           white_team_defense = {:defense => played_position.player}
#         when :blue_offense
#           blue_team_offense = {:offense => played_position.player}
#         when :blue_defense
#           blue_team_defense = {:defense => played_position.player}
#         end
#       end
#       white_team = white_team_offense.merge white_team_defense
#       blue_team = blue_team_offense.merge blue_team_defense
#       teams_array << white_team
#       teams_array << blue_team
#     end
#     teams_array.uniq.each do |team|
#       teams << Team.new(team)
#     end
#     teams
#   end
# 
#   def games
#     this_team = [offense, defense]
#     team_games = []
#     games = Game.all
#     games.each do |game|
#       white_team = []
#       blue_team = []
#       game_positions = []
#       game.played_positions.each do |played_position|
#         case played_position.position
#         when :white_offense
#           white_team[0] = played_position.player
#         when :white_defense
#           white_team[1] = played_position.player
#         when :blue_offense
#           blue_team[0] = played_position.player
#         when :blue_defense
#           blue_team[1] = played_position.player
#         end          
#       end
#       team_games << game if white_team == this_team || blue_team == this_team
#     end
#     team_games
#   end
# 
#   def number_of_wins
#     count = 0
#     games.each do |game|
#       count += 1 if game.winning_team.offense == self.offense && game.winning_team.defense == self.defense
#     end
#     count
#   end
# end
