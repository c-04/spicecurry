class AdministratorPages::ShopsController < ApplicationController

  # アドミンユーザ以外のアクセスを防ぐ
  skip_before_action :authenticate_user!
  before_action :authenticate_administrator_page!


  def index
    @shops= Shop.all.order(created_at: :desc)
  end

  def show
    @shop=Shop.find(params[:id])
  end

  def new
    @shop=Shop.new
  end

  def create
    shop=Shop.new(shop_params)
    if shop.save
          flash[:notice] = "successfully"
          redirect_to administrator_pages_shop_path(shop.id)
    else
          flash[:notice] = "error"
          redirect_to administrator_pages_shops_path
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    shop = Shop.find(params[:id])
    if  shop.update(shop_params)
        flash[:notice] = "店舗情報を編集しました"
        redirect_to administrator_pages_shop_path(shop.id)
    else
        flash[:notice] = "店舗情報の編集に失敗しました"
        render :edit
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to administrator_pages_shops_path
  end

  private
    def shop_params
      params.require(:shop).permit(:name,:kana_name,:station,:place,:instagram,:image,:place_name)
    end

end
