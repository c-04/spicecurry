class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  validates :comment,length: { in: 1..30 }        

end
