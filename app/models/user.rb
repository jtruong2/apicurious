class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
     user.email = auth.info.email
     user.uid = auth.uid
     user.provider = auth.provider
     user.avatar_url = auth.info.image
     user.username = auth.info.nickname
     user.name = auth.info.name
     user.oauth_token = auth.credentials.token
     user.save!
    end
  end
  #
  # def self.update_or_create(auth)
  #   user = User.find_by(uid: auth[:uid]) || User.new
  #   byebug
  #   user.attributes = {
  #     user.email = auth.info.email
  #     user.uid = auth.uid
  #     user.provider = auth.provider
  #     user.avatar_url = auth.info.image
  #     user.username = auth.info.nickname
  #     user.name = auth.info.name
  #     user.oauth_token = auth.credentials.token
  #   }
  #   user.save!
  #   user
  # end
end
