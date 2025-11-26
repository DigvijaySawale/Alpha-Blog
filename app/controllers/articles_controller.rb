class ArticlesController < ApplicationController
  def show
    # binding.pry
    # byebug
    @article = Article.find(params[:id])
  end

  def index 
    @articles = Article.all
  end
end
