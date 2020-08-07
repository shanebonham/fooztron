require 'rails_helper'

describe User do
  let(:pico) { users(:pico) }

  describe '.first_or_create_with_uid' do
    context 'when the uid exists' do
      it 'does not create a new user' do
        expect do
          User.first_or_create_with_uid(uid: pico.uid)
        end.to_not change { User.count }
      end

      it 'returns the user' do
        user = User.first_or_create_with_uid(uid: pico.uid)
        expect(user).to eq(pico)
      end
    end

    context 'when the uid does not exist' do
      it 'creates a new user' do
        expect do
          User.first_or_create_with_uid(uid: 'a123', info: { email: 'heinz@pco.bu', nickname: 'heinz_tweets' })
        end.to change { User.count }.by(1)
      end

      it 'set the attributes correctly' do
        user = User.first_or_create_with_uid(uid: 'a123', info: { email: 'heinz@pco.bz', nickname: 'heinz_tweets' })
        expect(user.uid).to eq('a123')
        expect(user.email).to eq('heinz@pco.bz')
        expect(user.nickname).to eq('heinz_tweets')
      end

    end
  end
end
