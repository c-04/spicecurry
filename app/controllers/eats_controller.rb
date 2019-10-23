class EatsController < ApplicationController
  def create
    shop = Shop.find(params[:shop_id])
    eats= current_user.eats.new(shop_id:shop.id)
    eats.save
   redirect_to shop_path(shop)
  end
  def destroy
    shop = Shop.find(params[:shop_id])
    eats= current_user.eats.find_by(shop_id:shop.id)
    eats.destroy
    redirect_to shop_path(shop)

  end
end
