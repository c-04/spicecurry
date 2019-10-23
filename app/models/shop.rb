class Shop < ApplicationRecord
  attachment :image

  has_many :post_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  def bookmark_by?(user)
          bookmarks.where(user_id: user.id).exists?
  end
  has_many :eats, dependent: :destroy
  def eat_by?(user)
          eats.where(user_id: user.id).exists?
  end

  has_many :favorites, dependent: :destroy
  def favorite_by?(user)
          favorites.where(user_id: user.id).exists?
  end
end
