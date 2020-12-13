# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity, type: :model do
  fixtures :users

  let(:valid_params) do
    { user_id: 1, start_date: '2020-1-1', end_date: '2020-2-2', subject: 'teste' }
  end

  let(:invalid_params) do
    { status: 'Espera' }
  end


end
