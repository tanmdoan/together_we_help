require 'delegate'

class OpportunityPresenter < SimpleDelegator
  def formatted_description
    self['plaintextDescription'].capitalize
  end

  def organization
    self["parentOrg"]['name']
  end

  def title
    self["title"]
  end
end
