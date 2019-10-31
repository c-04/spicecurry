class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  attachment :profile_image
  validates :comment,length: { in: 1..30 }        # 「1文字以上75文字以下」

end
