require 'spec_helper'

describe FocalArea do
  it { should have_and_belong_to_many(:indicators) }
end
