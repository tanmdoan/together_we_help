class OpportunitiesPresenter
  attr_reader :data

  def initialize(data)
    @data = data["opportunities"]
  end

  def organization_names
    data.map do |opportunity|
      opportunity["parentOrg"]["name"]
    end
  end

  def descriptions
    data.map do |opportunity|
      opportunity["plaintextDescription"]
    end
  end
end
