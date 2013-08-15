class Subscription < ActiveRecord::Base
  # Validations
  validates :email, uniqueness: { case_sensitive: false }, presence: true, length: { maximum: 255 }, format: { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # Callbacks
  before_create :generate_token

  private
    def generate_token
      self.token = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless Subscription.where(token: random_token).exists?
      end
    end
end
