class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      # エラー時は入力画面に戻す（Rails 7以降は status: :unprocessable_entity が必要）
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
    @my_shops = @user.shops
    @liked_shops = @user.liked_shops
  end
  
  def edit
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to user_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private

  def user_params
    # :password と :password_confirmation が含まれている必要があります
    params.require(:user).permit(:uid, :city, :password, :password_confirmation)
  end
end
