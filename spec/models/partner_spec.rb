require 'spec_helper'

describe Partner do
  it { should have_and_belong_to_many(:indicators) }
end
