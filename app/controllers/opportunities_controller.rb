class OpportunitiesController < ApplicationController
  def index
    @opportunities = Opportunity.all
  end

  def new
    @opportunity = Opportunity.new
    @opportunities = Opportunity.collect_opportunities
  end

  def create
    @opportunity = Opportunity.create(opportunity_params)
    redirect_to opportunities_path
  end


  private

  def opportunity_params
    params.require(:opportunity).permit(:organization_name, :title, :start_date,
                                        :description)
  end
end
