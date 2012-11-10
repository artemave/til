OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:twitter, {
  :provider => 'twitter',
  :uid => '12345',
  :info => {
    :name => 'Artem',
    :nickname => 'artemave',
    :email => 'artem@example.com',
  }
})
