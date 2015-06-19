class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: %i(slugged finders)
end
