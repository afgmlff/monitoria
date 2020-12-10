require 'rails_helper'

RSpec.describe Activity, type: :model do
  fixtures :users

  let(:valid_admin_params) {
    {user_id: users(:admin).id, status: 'Espera'}
  }

  let(:invalid_params) {
    {status: 'Espera'}
  }

  let(:valid_tutor_params) {
    {user_id: users(:admin).id, status: 'Aprovado'}
  }

    describe 'checks a creation' do

      context 'when a invalid record' do
        it 'has valid attributes' do
          expect(
            Activity.new(invalid_params)
          ).to_not be_valid
        end
      end
    end
    
end