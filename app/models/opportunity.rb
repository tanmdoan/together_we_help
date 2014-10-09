class Opportunity < ActiveRecord::Base

  def self.collect_opportunities
    data = VolunteerMatchApi.new.find_events_by_location('Denver, CO')
    data['opportunities'].map do |opportunity|
      OpportunityPresenter.new(opportunity)
    end
  end
end
