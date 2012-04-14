# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :db_session do
    session "MyString"
    user ""
  end
end
