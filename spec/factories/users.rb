FactoryGirl.define do

  factory :user do
    name { "UserTest" }
    email { "email@teste.com" }
    password { "12345" }
  end

end
