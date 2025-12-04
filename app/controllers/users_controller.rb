class UsersController < ApplicationController

  def index 
    @users = User.all
  end 

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = "Welcome to Alpha blog #{@user.username}, you have signed up successfully"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update
    # binding.pry
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User Details was updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
