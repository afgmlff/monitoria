FactoryGirl.define do

  factory :user do
    name { "UserTest" }
    email { "email@teste.com" }
    password { "123456" }
  end

end
