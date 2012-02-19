require 'spec_helper'

describe TilsController do
  it "creates til" do
    assert_difference('Til.count') do
      post :create, til: { content: 'awesome til' }
    end
  end

  it "reports error" do
    assert_no_difference('Til.count') do
      post :create, til: {}
    end
    response.status.should_not == 200
    response.body.should include("content can't be blank")
  end
end
