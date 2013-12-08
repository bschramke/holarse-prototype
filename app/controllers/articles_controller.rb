# encoding: utf-8
class ArticlesController < ApplicationController

  before_filter :require_edit_permissions, :except => [:index, :show]

  add_breadcrumb "Artikel", :articles_path

  def index
    @articles = Article.order('created_at DESC')
    add_breadcrumb "Index", articles_path
  end

  def new
    @article = Article.new(project_activity_state: ProjectActivityState.find_by_code(:active))
    render :edit
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to @article
    else
      redirect_to :back
    end  
  end

  def edit
    @article = Article.find(params[:id])
    add_breadcrumb @article.title, article_path(@article)
  end

  def update
    @article = Article.find(params[:id])
    @article.user = current_user

    if @article.update_attributes(article_params)
      redirect_to @article
    else
      redirect_to :back
    end  
  end

  def destroy
  end

  def show
    @article = Article.find(params[:id]).decorate
    add_breadcrumb @article.title, article_path(@article)
  end

  private

  def require_edit_permissions
    if !is_logged_in?
      flash[:info] = "Bitte anmelden zum Bearbeiten des Artikels."
      persist_position self.controller_name, self.action_name, params[:id]
      redirect_to login_path
    end
  end

  def article_params
    params.require(:article).permit(:title, :alternate_title, :content, :unreleased, :releasedate, :category_list, :genre_list, :comment, :project_activity_state_id)
  end


end
