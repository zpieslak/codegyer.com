class Testimonial < ActiveRecord::Base
  scope :default_order, -> { order(position: :asc) }
end
