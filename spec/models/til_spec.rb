require 'spec_helper'

describe Til do
  it { should validate_presence_of(:content) }
end
