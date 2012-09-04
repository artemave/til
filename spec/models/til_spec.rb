require 'spec_helper'

describe Note do
  it { should validate_presence_of(:content) }
end
