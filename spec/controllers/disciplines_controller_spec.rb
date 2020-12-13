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

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(assigns(:discipline)).to be_a_new(Discipline)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Discipline' do
        expect do
          post :create, params: { discipline: valid_attributes }, session: valid_session
        end.to change(Discipline, :count).by(1)
      end
      it 'assigns a newly created discipline as @discipline' do
        post :create, params: { discipline: valid_attributes }, session: valid_session
        expect(assigns(:discipline)).to be_a(Discipline)
        expect(assigns(:discipline)).to be_persisted
      end
    end
    context 'with invalid params' do
      it 'assigns a newly created but unsaved discipline as @discipline' do
        post :create, params: { discipline: invalid_attributes }, session: valid_session
        expect(assigns(:discipline)).to be_a_new(Discipline)
      end
    end
  end
  
end
