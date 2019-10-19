class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  attachment :profile_image

end
