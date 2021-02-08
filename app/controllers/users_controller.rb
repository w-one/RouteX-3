class UsersController < ApplicationController
  layout 'user'

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



  def userhowto
    @user = User.find(params[:id]) 
  end

  def usernote
    @user = User.find(params[:id]) 
  end
  
end
