# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :journal do
    name "MyString"
    description "MyText"
    user nil
    journal_type nil
    is_primary false
  end
end
