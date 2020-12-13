# frozen_string_literal: true

FactoryGirl.define do
  sequence :discipline_id do |n|
    n
  end

  factory :discipline do
    id { generate(:discipline_id) }
    name { 'MP' }
  end
end
