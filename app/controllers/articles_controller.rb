class ArticlesController < ApplicationController

  before_filter :require_edit_permissions, :except => [:show]

  def index
    @articles = Article.order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.user = current_user
    if @article.save
      redirect_to @article
    else
      redirect_to :back
    end  
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    historified_article = @article.amoeba_dup
    historified_article.save

    if @article.update_attributes(params[:article])
      redirect_to @article
    else
      redirect_to :back
    end  
  end

  def destroy
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def require_edit_permissions
    unless is_logged_in?
      flash[:warning] = "Bitte anmelden, um Artikel erstellen oder bearbeiten zu k&ouml;nnen."
      redirect_to :back
    end
  end
end
