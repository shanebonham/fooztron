class TeamGame < ActiveRecord::Base
  belongs_to :game
  belongs_to :team
  as_enum :side, :white => 0,
                 :blue => 1
end
