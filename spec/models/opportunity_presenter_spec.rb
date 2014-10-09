require 'rails_helper'

describe 'opportunity presenter', type: :model do

  def data_hash
    {
      "description" => "hi, im a description",
      "title" => "hi, im a title",
      "vmUrl" => "hi, im a url",
      "availability"=> { "startDate" => "hi, im a startdate" 
      }
    }
  end

  let(:presenter) { OpportunityPresenter.new(data_hash) }

  it 'presents the description' do
    expect(presenter.description). to eq "hi, im a description"
  end

  it 'presents the title' do
    expect(presenter.title). to eq "hi, im a title"
  end

  it 'presents the vmUrl' do
    expect(presenter.vm_url). to eq "hi, im a url"
  end

  it 'presents the startdate' do
    expect(presenter.start_date). to eq "hi, im a startdate"
  end
end
