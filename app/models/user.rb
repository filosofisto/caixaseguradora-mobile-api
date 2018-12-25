class User < ApplicationRecord
  has_secure_password

  before_validation do
    (self.email = self.email.to_s.downcase)
  end

  validates_presence_of :email

  validates_length_of :password, maximum: 100, minimum: 8, allow_nil: true, allow_blank: false
  validates_confirmation_of :password, allow_nil: true, allow_blank: false
  validates_length_of :email, maximum: 50

  validates_uniqueness_of :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def can_modify_user? user_id
    user_id.to_s == id.to_s
  end
end
