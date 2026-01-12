class MyArticlesController < ApplicationController
  def index
    @my_articles = MyArticle.all
  end
  def show
    @my_articles = MyArticle.find(params[:id])
  end
  
end
