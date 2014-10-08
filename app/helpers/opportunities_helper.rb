module OpportunitiesHelper

  def get_description(data)
    data["plaintextDescription"].capitalize + "."
  end

  def get_title(data)
    data['title'].capitalize
  end

  def get_organization(data)
    data['parentOrg']['name'].capitalize
  end
end
