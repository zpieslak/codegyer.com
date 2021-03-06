class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: %i(slugged finders)

  paginates_per 3
end
