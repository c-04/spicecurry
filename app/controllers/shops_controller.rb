class ShopsController < ApplicationController
  #ログイン認証をスキップする
  skip_before_action :authenticate_user! ,{only: [:index,:random]}

  def index
    @random = Shop.order("RANDOM()").limit(1)
    @shops = Shop.order("RANDOM()").all
  end

  def show
    @shop=Shop.find(params[:id])
    @post_comment = PostComment.new
  end

  def random
    @shop=Shop.find(params[:id])
    @shops = Shop.order("RANDOM()").limit(1)
  end

  def search
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true).order("RANDOM()").all
  end

  def eat
    @eat_ranks = Shop.find(Eat.group(:shop_id).order('count(shop_id) desc').pluck(:shop_id))
  end

  def favorite
      @favorite_ranks = Shop.find(Favorite.group(:shop_id).order('count(shop_id) desc').pluck(:shop_id))
  end

  def  bookmark
      @bookmark_ranks = Shop.find(Bookmark.group(:shop_id).order('count(shop_id) desc').pluck(:shop_id))
      #@bookmark_ranks = Shop.find(Bookmark.group(:shop_id).order('count(shop_id) desc').limit(3).pluck(:shop_id))
  end

end
