# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :crop do
    name "MyString"
    description "MyString"
    planted_date "2012-07-08 13:59:26"
    crop_strain_id 1
    seed_count 1
    farm_id 1
  end
end
