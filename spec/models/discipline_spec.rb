# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Discipline, type: :model do
  describe '#discipline?' do
    context 'when everything is normal' do
      it 'be_valid' do
        discipline = build(:discipline)
        expect(discipline).to be_valid
      end
    end
  end

  describe 'validation' do
    context 'when creating a discipline with a blank name' do
      it 'not be_valid' do
        discipline = build(:discipline, name: '')
        expect(discipline).not_to be_valid
      end
    end
  end
end
