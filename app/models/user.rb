class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
     user.email = auth.info.email
     user.uid = auth.uid
     user.provider = auth.provider
     user.avatar_url = auth.extra.raw_info.avatar_url
     user.username = auth.info.nickname
     user.name = auth.info.name
     user.oauth_token = auth.credentials.token
     user.save!
    end
  end
end
