require 'spec_helper'

describe NotesController, focus: true do
  render_views

  let(:current_user) { create :user }

  before do
    sign_in current_user
  end

  describe "#create" do
    let(:invoke_action) do
      post :create, note: { content: 'awesome note' }, format: :json
    end

    it_behaves_like 'an authorized action'

    it "creates note" do
      assert_difference('Note.count', 1) do
        invoke_action
      end
      assert_response :success
    end
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
