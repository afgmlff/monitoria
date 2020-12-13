# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
  let(:valid_attributes) do
    { user_id: 1, start_date: '2020-1-1', end_date: '2020-2-2', subject: 'teste' }
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


end
