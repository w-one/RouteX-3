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


  
  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
  
end
