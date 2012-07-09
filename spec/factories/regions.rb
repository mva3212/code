# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :region do
    name "MyString"
    description "MyString"
    climate_id 1
    country_id 1
    code "MyString"
  end
end
