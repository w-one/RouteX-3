class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) 
  end

  def search
    if params[:search] == nil
      @users= User.none
    elsif params[:search] == ''
      @users=User.none
    else
      @users = User.where("username LIKE ? ",'%' + params[:search] + '%')
    end
  end
  
end
