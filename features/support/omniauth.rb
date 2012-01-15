OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:twitter, {
  :provider => 'twitter',
  :uid => '12345',
  :nickname => 'fooman',
  :user_info => {
    :first_name => 'Foo',
    :email => 'fooman@example.com',
    :last_name => 'Man'
  }
})
