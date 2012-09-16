require 'spec_helper'

describe NotesController do
  render_views

  it "creates note" do
    assert_difference('Note.count', 1) do
      post :create, note: { content: 'awesome note' }, format: :json
    end
    assert_response :success
  end

  it 'destroys note' do
    note = create :note
    assert_difference('Note.count', -1) do
      delete :destroy, id: note.id
    end
  end

  it "reports validation errors" do
    assert_no_difference('Note.count') do
      post :create, note: {}, format: :json
    end
    response.status.should_not == 200
    response.body.should include("can't be blank")
  end
end
