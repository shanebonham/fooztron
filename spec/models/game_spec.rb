require 'rails_helper'

describe Game do
  describe 'validations' do
    let(:game) { Game.new(white_score: 1, blue_score: 2) }
    subject { game }

    context 'when neither team has a max score' do
      it { is_expected.not_to be_valid }
    end
    context 'when the teams are tied' do
      before { game.blue_score = game.white_score }
      it { is_expected.not_to be_valid }
    end
    context 'when one team has the max score' do
      before { game.white_score = game.maximum_score }
      it { is_expected.to be_valid }
    end
    context 'when both teams have the max score' do
      before do
        game.white_score = game.maximum_score
        game.blue_score = game.maximum_score
      end
      it { is_expected.to_not be_valid }
    end
  end
end
