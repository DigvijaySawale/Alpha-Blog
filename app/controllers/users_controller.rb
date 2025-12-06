class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  
  def index 
    # @users = User.all
    @users = User.paginate(page: params[:page], per_page: 2)

  end 

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Alpha blog #{@user.username}, you have signed up successfully"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit 
    #@user = User.find(params[:id])   ##added to before action
  end

  def update
    # binding.pry
    #@user = User.find(params[:id])   ##added to before action
    if @user.update(user_params)
      flash[:notice] = "User Details was updated successfully"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    #@user = User.find(params[:id])   ##added to before action
    # @articles = @user.articles
    @articles = @user.articles.paginate(page: params[:page], per_page: 2)

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
