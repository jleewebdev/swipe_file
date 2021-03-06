class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "User created and successfully logged in."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(slug: params[:slug])
    @posts = @user.posts
    @comments = @user.comments
  end
  
 private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
 end
end