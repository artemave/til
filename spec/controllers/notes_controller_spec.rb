require 'spec_helper'

describe NotesController do
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
      current_user.notes.first.content.should == 'awesome note'
    end

    it "reports validation errors" do
      assert_no_difference('Note.count') do
        post :create, note: {}, format: :json
      end
      response.status.should_not == 200
      response.body.should include("can't be blank")
    end
  end

  describe "#update" do
    let(:note) { create :note, content: 'old content' }
    let(:invoke_action) do
      put :update, id: note.id, note: { content: 'awesome note' }, format: :json
    end

    before do
      current_user.notes = [note]
    end

    it_behaves_like 'an authorized action'

    it "updates note" do
      invoke_action

      assert_response :success
      current_user.notes.reload.first.content.should == 'awesome note'
    end

    it "reports validation errors" do
      assert_no_difference('Note.count') do
        put :update, id: note.id, note: { content: nil }, format: :json
      end
      response.status.should_not == 200
      response.body.should include("can't be blank")
    end
  end

  describe "#destroy" do
    let(:note) { create :note }
    let(:invoke_action) { delete :destroy, id: note.id }

    it_behaves_like 'an authorized action'

    before do
      current_user.notes = [note]
    end

    it 'destroys note' do
      invoke_action

      current_user.notes.reload.count.should == 0
    end
  end

end
