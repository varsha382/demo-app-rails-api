class User < ApplicationRecord
  authenticates_with_sorcery!
  before_validation :check_confirmation_password

  validates_presence_of :email, :user_name, :password
  attr_accessor :password_confirmation

  def check_confirmation_password
    errors.add(:password_confirmation, "Did not match password") if password_confirmation && password != password_confirmation
  end
end
