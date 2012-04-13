require 'spec_helper'

describe Goal do
  it { should have_many(:targets) }
end
