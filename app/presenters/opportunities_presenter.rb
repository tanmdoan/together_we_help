class OpportunitiesPresenter
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def organization_names
    data["opportunities"].map do |organization|
      organization["parentOrg"]["name"]
    end
  end
end
