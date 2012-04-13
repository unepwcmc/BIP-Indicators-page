require 'spec_helper'

describe Indicator do
  it { should belong_to(:headline) }
  it { should have_and_belong_to_many(:targets) }
  it { should have_and_belong_to_many(:focal_areas) }
  it { should have_and_belong_to_many(:partners) }

  it 'should return a link composed by bipindicators.net and #rel_link' do
    indicator = FactoryGirl.create(:indicator, rel_link: 'abc')
    indicator.link.should eq('http://www.bipindicators.net/abc')
  end
end
