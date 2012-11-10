class User < ActiveRecord::Base

  has_many :notes

  def self.find_or_create_with_omniauth(auth)
    user = where(provider: auth["provider"], uid: auth["uid"]).first
    user || create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end
