class UsersController < ApplicationController
  layout 'user'

  def show
    @user = User.find(params[:id]) 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to :action => "show", :id => user.id
    else
      redirect_to :action => "edit"
    end
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

  def user_params
    params.require(:user).permit(:username, :nickname, :email, :profile, :profile_image, :remove_profile_image, :twitter, :facebook, :instagram)
  end
  
end
