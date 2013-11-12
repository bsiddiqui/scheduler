# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :schedule do
    trip_id 1
    price "9.99"
    max_size 1
    wdays [0, 1]
    time "2013-11-10 16:13:47"
  end
end
