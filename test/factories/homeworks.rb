# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :homework do
    list_id 1
    title "MyString"
    message "MyText"
    deadline "2012-03-23 18:01:15"
  end
end
