FactoryGirl.define do
  factory :user do
    sequence(:username){|n| "u#{n}"}
    sequence(:email){|n|"#{n}@users.com"}
    password 'z'*8
  end
end

