# Class UsersController
class UsersController < ApplicationController
  def index
    @users = User.search(params[:search]).ordered
  end

  def show
    @user = User.find(params[:id])
  end

end
