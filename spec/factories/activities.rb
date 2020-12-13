# frozen_string_literal: true

FactoryGirl.define do
  sequence :activity_id do |n|
    n
  end

  factory :activity do
    id { generate(:activity_id) }
    user_id { 1 }
    start_date { '2020-1-1' }
    end_date { '2020-2-2' }
    subject { 'Monitoria de' }
  end
end
