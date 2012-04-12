require 'spec_helper'

describe Headline do
  it { should have_many(:indicators) }
end
