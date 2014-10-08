# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :opportunity, :class => 'Opportunities' do
    title 'Food Giver'
    description 'Them kids need the helping they deserve.'
    organization 'Help The kids'
  end
end
