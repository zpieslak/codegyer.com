class Message < ActiveRecord::Base
  include ActionView::Helpers::SanitizeHelper

  # Validations
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }, format: { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :content, presence: true, length: { maximum: 5000 }

  # Callbacks
  before_validation :strip_html

  private
    def strip_html
      self.content = strip_tags(content).strip if content.present?
    end
end
