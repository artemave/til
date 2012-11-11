require 'spec_helper'

describe User do
  describe "#find_or_create_with_omniauth" do
    let(:auth) {{
      'provider' => 'twitter',
      'uid' => '232d23d',
      'info' => {
        'name' => 'artem',
        'email' => 'artem@gmail.com'
      }
    }}

    context "existing user" do
      before do
        create :user, provider: 'twitter', uid: '232d23d'
      end

      it 'finds user' do
        assert_no_difference 'User.count' do
          user = User.find_or_create_with_omniauth(auth)

          user.uid.should == '232d23d'
          user.provider.should == 'twitter'
        end
      end
    end

    context "user not found" do
      it 'creates user' do
        assert_difference 'User.count', 1 do
          user = User.find_or_create_with_omniauth(auth)

          user.uid.should == '232d23d'
          user.provider.should == 'twitter'
        end
      end
    end
  end
end
