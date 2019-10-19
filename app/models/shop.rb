class Shop < ApplicationRecord
  attachment :image
  
  has_many :post_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  def bookmark_by?(user)
          bookmarks.where(user_id: user.id).exists?
  end
end
