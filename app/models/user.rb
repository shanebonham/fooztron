class User < ActiveRecord::Base
  validates :email, presence: true

  def self.first_or_create_with_uid(auth_hash)
    auth_hash = HashWithIndifferentAccess.new(auth_hash)
    user = where(uid: auth_hash[:uid]).first_or_create do |u|
      u.uid = auth_hash[:uid]
      u.email = auth_hash[:info].try(:[], :email)
    end
    user if user.persisted?
  end
end
