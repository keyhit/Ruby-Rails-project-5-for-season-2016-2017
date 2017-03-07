module UsersHelper
  def compare_password(password)
    self.password_hash == generate_hash_for_password(password)
  end

  def generate_hash_for_password(password)
    Digest::MD5.hexdigest(self.email + ':' + password)
  end

  def self.get_user_for_token(token)
    user = nil
    if token != nil
      Token.all.each do |token_itr|
        if token_itr.token == token
          user = User.find(token_itr.user_id)
          break
        end
      end
    end
    user
  end
end
