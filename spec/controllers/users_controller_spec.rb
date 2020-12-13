# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) do
    { name: 'Joao', email: 'joao@teste.com', password: 'teste123', role: 'aluno' }
  end

  let(:invalid_attributes) do
    { email: '' }
  end

  let(:valid_session) { {} }

  let(:users) { create_list :user, 1 }

  describe 'GET #index' do
    before do
      @users = [FactoryGirl.build_stubbed(:user)]
      allow(User).to receive(:all).and_return(@users)
      get :index
    end

    it 'returns a success response' do
      expect(assigns(:users)).to match_array(@users)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested user as @user' do
      user = User.create! valid_attributes
      get :show, params: { id: user.to_param }, session: valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested user as @user' do
      user = User.create! valid_attributes
      get :edit, params: { id: user.to_param }, session: valid_session
      expect(assigns(:user)).to eq(user)
    end
  end


  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { role: 'tutor' }
      end

      it 'updates the requested user' do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: new_attributes }, session: valid_session
        user.reload
        expect(user.role).to eq(new_attributes[:role])
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      user = User.create! valid_attributes
      expect do
        delete :destroy, params: { id: user.to_param }, session: valid_session
      end.to change(User, :count).by(-1)
    end
  end
  
end
