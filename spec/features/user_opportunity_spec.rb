require 'rails_helper'

describe 'opportunities' do

  it 'can be found by an authenticated user' do
    class Opportunity
      def self.collect_opportunities
        opportunity = {
            "description"  => "Gerine's description.",
            "title"        => "Help The Kids",
            "vmUrl"        => "http//www.thekids.com",
            "availability" => { "startDate" => "3000/12/12" },
            "parentOrg"    => { "name"      => "Gerine's"   }
          }

        [OpportunityPresenter.new(opportunity)]
      end
    end

    sign_in
    click_link_or_button('Find Opportunities')

    expect(current_path).to eq(new_opportunity_path)
    expect(page).to have_content("Gerine's description.")
    expect(page).to have_content('Help The Kids')
  end


  it 'can be created by an authenticated user for voting' do
    class Opportunity
      def self.collect_opportunities
        opportunity = {
            "description"  => "Gerine's description.",
            "title"        => "Help The Kids",
            "vmUrl"        => "http//www.thekids.com",
            "availability" => { "startDate" => "3000/12/12" },
            "parentOrg"    => { "name"      => "Gerine's"   }
          }

        [OpportunityPresenter.new(opportunity)]
      end
    end

    sign_in
    click_link_or_button('Find Opportunities')
    expect(current_path).to eq(new_opportunity_path)
    first(:button, 'Create Opportunity').click

    opportunity = Opportunity.all.first
    expect(opportunity.organization_name).to eq("Gerine's")
  end

  it 'can be seen when visiting my pending opportunities' do
    opportunity = FactoryGirl.create(:opportunity)

    visit opportunities_path
    expect(current_path).to eq(opportunities_path)
    expect(page).to have_content(opportunity.title)
  end

  it 'of friends can be seen in pending opportunities' do
    sign_in
    user = User.where(email: 'bobgu@example.com').first_or_create
    user2 = FactoryGirl.create(:user, name: 'Chad')

    opportunity = FactoryGirl.create(:opportunity, user_id: user)
  end

  it 'should be able to see my confirmed opportunities and not unconfirmed' do
    sign_in
    user = User.where(email: 'bobgu@example.com').first_or_create
    opportunity = FactoryGirl.create(:opportunity,
                                     confirmed: true, user_id: user.id)
    opportunity2 = FactoryGirl.create(:opportunity,
                                      confirmed: false, user_id: user.id)

    click_link_or_button('My Confirmed Opportunities')

    expect(current_path).to eq(my_confirmed_opportunities_path)
    expect(page).to have_content(opportunity.title)
    
  end

  it 'should be able to confirm opportunities' do
    sign_in
    user = User.where(email: 'bobgu@example.com').first_or_create
    opportunity = FactoryGirl.create(:opportunity,
                                     confirmed: false, user_id: user.id)

    click_link_or_button('My Pending Opportunities')
    click_link_or_button('Confirm')

    expect(current_path).to eq(opportunities_path)
    expect(page).to_not have_content(opportunity.title)

    click_link_or_button('My Confirmed Opportunities')

    expect(current_path).to eq(my_confirmed_opportunities_path)
    expect(page).to have_content(opportunity.title)
  end
end
