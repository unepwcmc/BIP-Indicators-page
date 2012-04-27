require 'spec_helper'

describe Headline do
  it { should have_and_belong_to_many(:indicators) }
end
