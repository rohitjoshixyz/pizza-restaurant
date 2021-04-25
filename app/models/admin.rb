class Admin < ApplicationRecord
  belongs_to :cart, optional: true
  has_many :orders
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  
  def self.from_google(email:, full_name:, uid:, avatar_url:)
    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end
end
