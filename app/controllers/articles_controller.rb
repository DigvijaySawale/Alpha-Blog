class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    # binding.pry
    # byebug
    # @article = Article.find(params[:id]) #added before action
  end

  def index 
    # @articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 2)
  end

  def new
    @article = Article.new
  end

  def create
    # byebug
    # render plain: params[:article].inspect

    # @article = Article.new(params.require(:article).permit(:title, :description))
    @article = Article.new(article_params)
    # @article.user = User.first
    #adding current logged in user to set article user_id
    @article.user = current_user
    if @article.save
      # redirect_to articles_path
      flash[:notice] = "Article was created successfully"
      # redirect_to articles_path(@article)
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    # @article = Article.find(params[:id]) #added before action
    
  end

  def update 
    # binding.pry
    # @article = Article.find(params[:id]) #added before action
    # if @article.update(params.require(:article).permit(:title, :description))
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    # @article = Article.find(params[:id]) #added before action
    # binding.pry
    @article.destroy
    redirect_to articles_path
  end

  private 

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
