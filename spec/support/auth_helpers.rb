
def sign_in user
  session[:user_id] = user.id
end

shared_examples_for 'an authorized action' do
  context "no user signed in" do
    before do
      session[:user_id] = nil
    end

    it 'returns 401' do
      invoke_action
      response.status.should == 401
    end
  end

  context "user signed in" do
    before do
      session[:user_id] = create(:user).id
    end

    it 'returns 200' do
      invoke_action
      assert_response :success
    end
  end
end

