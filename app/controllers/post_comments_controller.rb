class PostCommentsController < ApplicationController
  def create
    shop = Shop.find(params[:shop_id])
   comment = current_user.post_comments.new(post_comment_params)
   comment.shop_id = shop.id
   comment.save
   redirect_to shop_path(shop)
  end





  private
def post_comment_params
  params.require(:post_comment).permit(:user_id,:shop_id,:comment)
end
end
