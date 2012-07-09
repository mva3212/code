# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :harvest_detail, :class => 'HarvestDetails' do
    name "MyString"
    summary "MyString"
    harvest_date "2012-07-08 14:58:11"
    total_wet_yield "9.99"
    total_dry_yield "9.99"
    yield_unit_id 1
    notes "MyString"
  end
end
