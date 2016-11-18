class User < ActiveRecord::Base
  before_save :encrypt_password

  def self.authenticate(email, password)
    user = find_by_email(email)
    return unless user.present?

    confirm_password = user.password_hash == ::BCrypt::Engine.hash_secret(password, user.password_salt)
    user if confirm_password
  end

  private

  def encrypt_password
    return unless password.present?

    self.password_salt = ::BCrypt::Engine.generate_salt
    self.password_hash = ::BCrypt::Engine.hash_secret(password, password_salt)
  end
end
