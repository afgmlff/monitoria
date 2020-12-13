# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.create(
      email: 'foo@bar.net',
      name: 'baz',
      password: 'chicken',
      password_confirmation: 'chicken'
    )
  end

  describe 'validates information' do
    before(:each) do
      @user = create(:user)
    end

    it 'has a valid factory' do
      expect(@user).to be_valid
    end

    it 'is valid with a name and email' do
      expect(@user).to be_valid
    end
  end


end
