class OpportunitiesController < ApplicationController
  def index
    @opportunities = Opportunity.all
  end

  def new
    data = VolunteerMatchApi.new.find_events_by_location('Denver, CO')
    @opportunity = Opportunity.new
    @opportunities = data['opportunities'].map do |opportunity|
      OpportunityPresenter.new(opportunity)
    end
  end

  def create
    @opportunity = Opportunity.create(opportunity_params)
    redirect_to root_path
  end


  private

  def opportunity_params
    params.require(:opportunity).permit(:organization_name)
  end
end
