class ArticlesController < ApplicationController

  before_filter :require_edit_permissions, :except => [:index, :show]

  add_breadcrumb "Artikel", :articles_path

  def index
    @articles = Article.order('created_at DESC')
    add_breadcrumb "Index", articles_path
  end

  def new
    @article = Article.new
    render :edit
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

    if @article.update_attributes(params[:article])
      redirect_to @article
    else
      redirect_to :back
    end  
  end

  def destroy
  end

  def show
    @article = ArticleShowDecorator.decorate(Article.find(params[:id]))
    add_breadcrumb @article.title, article_path(@article)
  end

  private

  def require_edit_permissions
    if !is_logged_in?
      flash[:info] = "Bitte anmelden zum Bearbeiten des Artikels."
      redirect_to login_path
    end
  end
end
