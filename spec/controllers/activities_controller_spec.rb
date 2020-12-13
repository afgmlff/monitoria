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

end
