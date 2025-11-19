class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @users = User.new
  end

  def create
    user = User.new(uid: params[:user][:uid],
                    password:params[:user][:password],
                    password_confirmation:params[:user][:password_confirmation])
    user.save
    redirect_to users_path
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end

  def show
    @users = User.find(params[:id])
  end
end
