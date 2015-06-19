class Subscription < ActiveRecord::Base
  # Validations
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }, format: { with: Devise.email_regexp }

  # Callbacks
  before_create :generate_token

  private
    def generate_token
      self.token = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless self.class.where(token: random_token).exists?
      end
    end
end
