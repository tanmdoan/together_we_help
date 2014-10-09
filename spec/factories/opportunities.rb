# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :opportunity do
    organization_name 'Help The Kids'
    title 'Kid Helper'
    description 'Them kids be needing help'
  end
end
