class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :like]
  before_action :check_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :new, :create, :like]

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
  end

  def index
    @articles = Article.all
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    render 'index'
  end

  def like
    if params[:type] == "like"
      @article.likes << Like.new(article: @article, user: current_user) # could also just be Like.create(article: @article, user: current_user)
      redirect_to @article, notice: "Liked!"
    else
      @article.likers.delete(current_user)
      redirect_to @article, notice: "Unliked :c"
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def check_user
    redirect_to(articles_url, notice: 'This ain\'t yours') if @article.user != current_user
  end
end
