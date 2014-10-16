class Opportunity < ActiveRecord::Base
  belongs_to :user
  acts_as_votable

  def self.collect_opportunities
    data = VolunteerMatchApi.new.find_events_by_location('Denver, CO')
    data['opportunities'].map do |opportunity|
      OpportunityPresenter.new(opportunity)
    end
  end

  def self.confirmed
    where(confirmed: true)
  end

  def self.unconfirmed
    where(confirmed: false)
  end
end
