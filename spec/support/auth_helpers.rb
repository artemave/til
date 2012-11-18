
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
      session[:user_id] = current_user
    end

    it 'returns 200' do
      invoke_action
      assert_response :success
    end
  end
end

shared_examples_for 'it is scoped to current user' do
  let(:other_resource) { create resource }
  before do
    current_user.send("#{resource}s=", [other_resource])
  end

  it "blows up" do
    expect { invoke_action }.to raise_error
  end
end
