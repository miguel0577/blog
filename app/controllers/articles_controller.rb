# frozen_string_literal: true

# Controller to show, add, edit, update and delete articles
class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
    @users = User.all
    if user_signed_in?
      @user_now = User.find(current_user.id)
    end
  end
  
  def show
    @article = Article.find(params[:id])
    @user = User.find(@article.owner)
    @rel = @user.followers.find_by(follower: current_user)
    
    if user_signed_in?
      @current_user_owner_article = true if @article.owner == current_user.id
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status, :owner)
  end
end
