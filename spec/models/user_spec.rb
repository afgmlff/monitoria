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

  describe 'information must exist' do
    before(:each) do
      @user = create(:user)
    end

    it 'is invalid without an email address' do
      @user.email = nil
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a password' do
      @user.password = ''
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end
  end

  describe 'information cannot already be in use' do
    before(:each) do
      @user1 = create(:user, email: 'email@email.com')
    end
    it 'is invalid with a duplicate email address' do
      user2 = build(:user, email: 'email@email.com')
      user2.valid?
      expect(user2.errors[:email]).to include('has already been taken')
    end
  end
end
