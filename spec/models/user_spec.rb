require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validates information" do
    before (:each) do
      @user = create(:user)
    end

    it "has a valid factory" do
      expect(@user).to be_valid
    end

    it "is valid with a name and email" do
      expect(@user).to be_valid
    end
  end


  describe "information must exist" do
    before (:each) do
      @user = build(:user)
    end

    it "is invalid without a name" do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
      @user.name = nil
      @user.valid?
      expect(@user.errors[:name]).to include("can't be blank")
    end

    it "is invalid without an email address" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
      @user.name = nil
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      @user.password = nil
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end
  end

  describe "information cannot already be in use" do

    it "is invalid with a duplicate email address" do
      User.create(name: 'nome', email: 'email@email.com', password: '12345')
      user = User.new(name: 'nome', email: 'email@email.com', password: '12345')
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end
  end

end
