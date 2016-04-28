require 'bcrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    errors.add(:password, "Password can't be blank") if new_password.empty?
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password_hash)
    user = User.find_by(email: email)
    begin
      return true if
      user.password == password_hash
    rescue
      return false
    end
  end
end
