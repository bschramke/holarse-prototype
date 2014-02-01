#encoding: utf-8
class NewsController < DraftableController

  before_filter :require_edit_permissions, :except => [:index, :show]

  add_breadcrumb "News"

  def index
    redirect_to root_path
  end

  def new
    @news = News.new
    render :edit
  end

  def create
    @news = News.new(news_params)
    @news.user = current_user

    if save_or_draft(@news)
      flash[:success] = "Deine Änderungen wurden angelegt"
      redirect_to @news and return
    else
      flash[:fatal] = "Es gab ein Problem beim Speichern"
      redirect_to :back and return
    end
  end

  def update
    @news = News.friendly.find(params[:id])
    @news.user = current_user

    @news.assign_attributes(news_params)

     if save_or_draft(@news)
      flash[:success] = "Deine Änderungen wurden angelegt"
      redirect_to @news and return
    else
      flash[:fatal] = "Es gab ein Problem beim Speichern"
      redirect_to :back and return
    end
  end

  def destroy
  end

  def show
    @news = News.friendly.find(params[:id]).decorate
    add_breadcrumb @news.title, news_path(@news)
  end

  def edit
    @news = News.friendly.find(params[:id])
  end
  
  private

  def require_edit_permissions
    if !is_logged_in?
      flash[:info] = "Bitte anmelden zum Bearbeiten der News."
      persist_position self.controller_name, self.action_name, params[:id]
      redirect_to login_path and return
    end

    unless has_role('admin', 'reporter')
      flash[:info] = "Sie m&uuml;ssen Reporter sein, um an den News arbeiten zu k&ouml;nnen."
      persist_position self.controller_name, self.action_name, params[:id]
      redirect_to :back
    end 
  end

  def news_params
    params.require(:news).permit(:title, :subtitle, :news_category_id, :category_list, :content)
  end 

end
