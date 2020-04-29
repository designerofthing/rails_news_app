# frozen_string_literal: true

require 'rails_helper'

describe 'check user db table' do
 

  describe User, type: :model do
    describe 'user db table' do
      it { is_expected.to have_db_column :email }
      it { is_expected.to have_db_column :encrypted_password }
    end

    describe 'Validations' do
      it { is_expected.to validate_presence_of :email }
      it { is_expected.to validate_presence_of :encrypted_password }
    end

    describe 'Factory' do
      let(:user) { FactoryBot.create(:user, email: 'testing@gmail.com') }
      it 'should have valid Factory' do
        expect(user).to be_valid
      end
    end
  end
end
