class Game < ActiveRecord::Base
  MAX_POINTS_PER_GAME = 8

  has_many :played_positions, :dependent => :destroy
  has_many :players, :through => :played_positions
  has_many :team_games
  has_many :teams, :through => :team_games

  accepts_nested_attributes_for :played_positions

  validates :white_score, :blue_score, :presence => true
  validate :one_score_must_be_max

  before_save do
    white = Team.find_or_create_by(offense_id: played_positions[0].player.id, defense_id: played_positions[1].player.id)
    blue = Team.find_or_create_by(offense_id: played_positions[2].player.id, defense_id: played_positions[3].player.id)
    self.team_games << TeamGame.new(:game => self, :team => white, :side => :white)
    self.team_games << TeamGame.new(:game => self, :team => blue, :side => :blue)
  end

  def winner
    white_score > blue_score ? 'white' : 'blue'
  end

  def spread
    (white_score - blue_score).abs
  end

  def winning_team
    team = Team.new
    if winner == 'white'
      team.offense = played_positions.where(:position_cd => 0).first.player
      team.defense = played_positions.where(:position_cd => 1).first.player
    else
      team.offense = played_positions.where(:position_cd => 2).first.player
      team.defense = played_positions.where(:position_cd => 3).first.player
    end
    team
  end

  def maximum_score
    MAX_POINTS_PER_GAME
  end

  private

  def one_score_must_be_max
    if white_score != maximum_score && blue_score != maximum_score
      errors[:base] << "One score must be #{maximum_score}"
    elsif white_score == blue_score
      errors[:base] << "Scores can't be the same"
    end
  end
end
