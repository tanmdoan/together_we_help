require 'delegate'

class OpportunityPresenter < SimpleDelegator

  def description
    self['description']
  end

  def organization
    self["parentOrg"]['name']
  end

  def title
    self["title"]
  end

  def vm_url
    self["vmUrl"]
  end

  def start_date
    self["availability"]["startDate"]
  end
end
