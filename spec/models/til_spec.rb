require 'spec_helper'

describe Til do
  it { should validate_presence_of(:content) }

  it "finds last modified til" do
    t1 = Til.create content: 'test'
    t2 = Til.create content: 'wat'
    t3 = Til.create content: 'another test'

    Delorean.jump 30
    t2.content = 'content'
    t2.save

    Til.last_modified.content.should == 'content'
  end
end
