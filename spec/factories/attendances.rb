# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attendance do
    user_id 1
    event_id 1
    guest_type "MyString"
    approved_at "2013-11-12 21:43:34"
  end
end
