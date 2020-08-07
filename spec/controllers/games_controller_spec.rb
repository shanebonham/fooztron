require 'rails_helper'

describe GamesController do
  let(:dhh) { players(:dhh) }
  let(:tenderlove) { players(:tenderlove) }
  let(:yehuda) { players(:yehuda) }
  let(:stallman) { players(:stallman) }

  context 'when given valid params' do
    before { session[:uid] = User.first.uid }

    let(:valid_params) do
      {
        game: { played_positions_attributes: [
          { player_id: dhh.id, position: 'white_offense' },
          { player_id: tenderlove.id, position: 'white_defense' },
          { player_id: yehuda.id, position: 'blue_offense' },
          { player_id: stallman.id, position: 'blue_defense' }
          ],
        white_score: 8,
        blue_score: 6 }
      }
    end

    it 'redirects to the index' do
      response = post :create, valid_params
      expect(response).to redirect_to (game_path(assigns(:game)))
    end

    it 'creates a new game' do
      expect { post :create, valid_params }.to change{ Game.count }.by(1)
    end
  end
end
