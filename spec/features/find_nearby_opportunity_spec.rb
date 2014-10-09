require 'rails_helper'

describe 'Opportunities' do

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
end
