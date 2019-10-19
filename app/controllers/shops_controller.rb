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
end
