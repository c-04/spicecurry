class UsersController < ApplicationController

  #ログインユーザーのみ実行可能
  before_action :authenticate_user!
  #ログインユーザーのみedit,update可能
  before_action :correct_user, {only: [:edit, :update,]}
  def correct_user
    @user = User.find_by(id: params[:id])
    if current_user != @user
      flash[:notice] = "権限がありません"
      redirect_to user_path(current_user.id)
    end
  end

  def show
    @user=User.find(params[:id])
    @bookmarks = Bookmark.where(user_id: @user.id).all
    @eats = Eat.where(user_id: @user.id).all
    @comments=PostComment.where(user_id: @user.id).all
  end

  def comments
    @user=User.find(params[:id])
    @comments=PostComment.where(user_id: @user.id).all
  end

  def bookmarks
    @user=User.find(params[:id])
    @bookmarks = Bookmark.where(user_id: @user.id).all
  end

  def favorites
    @user=User.find(params[:id])
    @favorites = Favorite.where(user_id: @user.id).all
  end

  def edit
    @user=User.find(params[:id])

  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
        flash[:notice] = "successfully"
        redirect_to user_path(@user.id)
    else
        flash[:notice] = "error"
        render :edit
    end

  end

  def leave
      @user=User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to shops_index_path
  end

  private
  def user_params
      params.require(:user).permit(:name, :profile_image,:introduction)
  end
end
