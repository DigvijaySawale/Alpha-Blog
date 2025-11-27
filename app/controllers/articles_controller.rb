class ArticlesController < ApplicationController
  def show
    # binding.pry
    # byebug
    @article = Article.find(params[:id])
  end

  def index 
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    # byebug
    # render plain: params[:article].inspect

    @article = Article.new(params.require(:article).permit(:title, :description))
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
    @article = Article.find(params[:id])
    
  end

  def update 
    # binding.pry
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    # binding.pry
    @article.destroy
    redirect_to articles_path
  end
end
