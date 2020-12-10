FactoryGirl.define do

  factory :user do
  	id { 2 }
    name { "userTest" }
    email { "user@test.com" }
    password { "123456" }
  end

  factory :admin do
  	id { 0 }
  	name { "adminTest" }
  	email { "admin@test.com" }
  	password { "123456" }
  end

  factory :tutor do
  	id { 1 }
  	name { "monitorTest" }
  	email { "tutor@test.com" }
  	password { "123456" }  
  end

end
