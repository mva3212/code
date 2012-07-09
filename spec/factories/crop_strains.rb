# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :crop_strain do
    name "MyString"
    description "MyString"
    crop_type_id 1
    extra_info "MyString"
  end
end
