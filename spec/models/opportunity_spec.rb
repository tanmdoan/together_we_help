require 'rails_helper'

RSpec.describe Opportunity, :type => :model do
  it 'collects opportunity array' do
    opp = Opportunity.collect_opportunities

    expect(opp.class).to eq Array
  end
end
