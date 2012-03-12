require 'spec_helper'

describe TilsController do
  render_views

  it "creates til" do
    assert_difference('Til.count') do
      post :create, til: { content: 'awesome til' }, format: :json
    end
    assert_response :success
  end

  it "reports error" do
    assert_no_difference('Til.count') do
      post :create, til: {}, format: :json
    end
    response.status.should_not == 200
    response.body.should include("can't be blank")
  end
end
