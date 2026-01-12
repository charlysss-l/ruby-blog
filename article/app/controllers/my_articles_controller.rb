class MyArticlesController < ApplicationController
  before_action :set_my_article, only: %i[show edit update destroy]

  def index
    @my_articles = MyArticle.all
  end

  def show
  end

  def new
    @my_article = MyArticle.new
  end

  def create
    @my_article = MyArticle.new(my_article_params)
    if @my_article.save
      redirect_to my_articles_path, notice: "Article created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @my_article.update(my_article_params)
      redirect_to @my_article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @my_article.destroy
    redirect_to my_articles_path
  end
  
  private
  def set_my_article
    @my_article = MyArticle.find(params[:id])
  end

  def my_article_params
    params.require(:my_article).permit(:title, :body)
  end
end
