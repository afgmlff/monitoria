# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
  let(:valid_user_params) do
    { name: 'Joao', email: 'joao@teste.com', password: 'teste123', role: 'aluno' }
  end

  before(:each) do
    @usuario = User.create!(valid_user_params)
  end

  let(:valid_attributes) do
    { user_id: @usuario.id, start_date: '2020-1-1', end_date: '2020-2-2', subject: 'teste' }
  end

  let(:invalid_attributes) do
    { subject: '' }
  end

  let(:valid_session) { {} }

  let(:activities) { create_list :activity, 1 }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(assigns(:activities)).to eq activities
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(assigns(:activity)).to be_a_new(Activity)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested activity as @activity' do
      activity = Activity.create! valid_attributes
      get :show, params: { id: activity.to_param }, session: valid_session
      expect(assigns(:activity)).to eq(activity)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Activity' do
        expect do
          post :create, params: { activity: valid_attributes }, session: valid_session
        end.to change(Activity, :count).by(1)
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested activity as @activity' do
      activity = Activity.create! valid_attributes
      get :edit, params: { id: activity.to_param }, session: valid_session
      expect(assigns(:activity)).to eq(activity)
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { subject: 'test 2.0' }
      end

      it 'updates the requested activity' do
        activity = Activity.create! valid_attributes
        put :update, params: { id: activity.to_param, activity: new_attributes }, session: valid_session
        activity.reload
        expect(activity.subject).to eq(new_attributes[:subject])
      end
    end

    context 'with invalid params' do
      it 'assigns the activity as @activity' do
        activity = Activity.create! valid_attributes
        put :update, params: { id: activity.to_param, activity: invalid_attributes }, session: valid_session
        expect(assigns(:activity)).to eq(activity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested activity' do
      activity = Activity.create! valid_attributes
      expect do
        delete :destroy, params: { id: activity.to_param }, session: valid_session
      end.to change(Activity, :count).by(-1)
    end
  end
end