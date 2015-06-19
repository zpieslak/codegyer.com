class Message < ActiveRecord::Base
  include ActionView::Helpers::SanitizeHelper

  # Validations
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: Devise.email_regexp }
  validates :content, presence: true, length: { maximum: 5000 }

  # Callbacks
  before_validation :strip_html, if: -> { content.present? }

  private
    def strip_html
      self.content = strip_tags(content).strip
    end
end
