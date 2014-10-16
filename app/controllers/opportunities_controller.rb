class OpportunitiesController < ApplicationController
  def index
    @opportunities = Opportunity.unconfirmed
  end

  def new
    @opportunity = Opportunity.new
    @opportunities = Opportunity.collect_opportunities
  end

  def create
    @opportunity = current_user.opportunities.create(opportunity_params)
    redirect_to opportunities_path
  end

  def friend_opportunities
    @opportunities = current_user.friends.map { |friend|
                                                friend.opportunities
                                              }.flatten
  end

  def my_confirmed
    @opportunities = current_user.opportunities.confirmed
  end

  def confirm
    @opportunity = Opportunity.find(params[:id]).toggle!(:confirmed)
    redirect_to opportunities_path
  end

  private

  def opportunity_params
    params.require(:opportunity).permit(:organization_name, :title, :start_date,
                                        :description)
  end
end
