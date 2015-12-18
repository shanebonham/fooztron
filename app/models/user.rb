class User < ActiveRecord::Base
  def self.first_or_create_with_uid(auth_hash)
    where(uid: auth_hash['uid']).first_or_create do |user|
      user.uid = auth_hash['uid']
      user.email = auth_hash['email']
    end
  end

  # def login!
  #   res = MonkId.login!(email: email, password: password)
  #   if res['success']
  #     update_attributes(:monk_authentication_token => res['user']['authentication_token'])
  #     self.save
  #   else
  #     self.errors.add(:base, res['message'])
  #     false
  #   end
  # end

  # def logout!
  #   res = MonkId.logout!(authentication_token: monk_authentication_token)
  #   res['success']
  # end
end
