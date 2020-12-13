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

  describe 'checks a creation' do
    context 'when a valid record' do
      it 'has valid attributes' do
        expect(
          Activity.new(valid_params)
        ).to be_valid
      end
    end

    context 'when a invalid record' do
      it 'has invalid attributes' do
        expect(
          Activity.new(invalid_params)
        ).to_not be_valid
      end
    end
  end
end
