class User < ActiveRecord::Base
  has_secure_password

  def self.authenticate(email, password)
    user = find_by(email: email)
    return user if user && user.authenticate(password)
  end

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end
end
