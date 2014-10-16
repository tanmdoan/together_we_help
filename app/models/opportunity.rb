class Opportunity < ActiveRecord::Base
  belongs_to :user

  def self.collect_opportunities
    data = VolunteerMatchApi.new.find_events_by_location('Denver, CO')
    data['opportunities'].map do |opportunity|
      OpportunityPresenter.new(opportunity)
    end
  end

  def self.confirmed
    where(confirmed: true)
  end
end
