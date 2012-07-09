# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :farm do
    name "MyString"
    description "MyString"
    region_fk 1
    state_fk 1
    user_fk 1
  end
end
