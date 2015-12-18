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
      context 'and there is an email in the auth_hash'
      it 'creates a new user' do
        expect do
          User.first_or_create_with_uid(uid: 'a123', info: { email: 'heinz@pco.bu' })
        end.to change { User.count }.by(1)
      end

      it 'set the attributes correctly' do
        user = User.first_or_create_with_uid(uid: 'a123', info: { email: 'heinz@pco.bz' })
        expect(user.uid).to eq('a123')
        expect(user.email).to eq('heinz@pco.bz')
      end

      context 'and there is not an email' do
        it 'returns nil' do
          user = User.first_or_create_with_uid(uid: 'abc')
          expect(user).to be_nil
        end

        it 'does not create a new user' do
          expect do
            User.first_or_create_with_uid(uid: 'abc')
          end.to_not change { User.count }
        end
      end
    end
  end
end
