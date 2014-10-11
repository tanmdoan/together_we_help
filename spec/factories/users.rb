# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "facebook"
    uid "1"
    name "Bob"
    first_name "Bob"
    email "bob@example.com"
    location "Africa"
  end
end
