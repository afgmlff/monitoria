# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DisciplinesController, type: :controller do
  let(:valid_attributes) do
    { name: 'test' }
  end

  let(:invalid_attributes) do
    { name: '' }
  end

  let(:valid_session) { {} }

  let(:disciplines) { create_list :discipline, 1 }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(assigns(:disciplines)).to eq disciplines
    end
  end

end
