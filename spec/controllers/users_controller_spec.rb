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


end
