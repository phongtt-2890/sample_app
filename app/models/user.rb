class User < ApplicationRecord
  before_save :downcase_email

  validates :name, presence: true, length: {maximum: Settings.max_name_length}
  validates :email, presence: true,
    length: {maximum: Settings.max_email_length},
    format: {with: Settings.email_regex}
  validates :password, presence: true,
    length: {minimum: Settings.min_password_length}, if: :password
  has_secure_password

  private

  def downcase_email
    email.downcase!
  end
end
