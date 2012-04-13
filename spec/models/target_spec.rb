require 'spec_helper'

describe Target do
  it { should belong_to(:goal) }
  it { should have_and_belong_to_many(:indicators) }
end
