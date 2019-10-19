class BookmarksController < ApplicationController
  def create
    shop = Shop.find(params[:shop_id])
    bookmarks= current_user.bookmarks.new(shop_id:shop.id)
    bookmarks.save
   redirect_to shop_path(shop)
  end
  def destroy
    shop = Shop.find(params[:shop_id])
    bookmarks= current_user.bookmarks.find_by(shop_id:shop.id)
    bookmarks.destroy
    redirect_to shop_path(shop)

  end
end
