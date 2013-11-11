# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    description "MyText"
    event_date "2013-11-11"
    polls_open "2013-11-11 09:21:58"
    polls_close "2013-11-11 09:21:58"
    owner_id 1
  end
end
