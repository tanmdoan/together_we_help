require "rails_helper"

RSpec.describe VolunteerMatchApi, :type => :model do


  it "creates and formats today's date" do
    api = VolunteerMatchApi.new
    expect(api.formatted_date_today).to eq('2014-10-08')
  end

  it "creates a date a month from today and formats it" do
    api = VolunteerMatchApi.new
    expect(api.today_plus_thirty).to eq('2014-11-07')
  end

end
