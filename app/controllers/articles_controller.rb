# encoding: utf-8
class ArticlesController < DraftableController

  before_filter :require_edit_permissions, :except => [:index, :show]
  before_filter :article_frozen?, only: [:edit, :update]

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
    @article = Article.new(has_role(:admin) ? article_admin_params : article_params)
    @article.user = current_user

    if save_or_draft(@article)
      flash[:success] = "Deine Änderungen wurden angelegt"
      redirect_to @article and return
    else
      flash[:fatal] = "Es gab ein Problem beim Speichern"
      redirect_to :back and return
    end
  end

  def edit
    @article = Article.find(params[:id])
    add_breadcrumb @article.title, article_path(@article)
  end

  def update
    @article = Article.find(params[:id])
    @article.user = current_user

    # änderungen am model hinterlegen
    @article.assign_attributes(has_role(:admin) ? article_admin_params : article_params)

    if save_or_draft(@article)
      flash[:success] = "Deine Änderungen wurden gespeichert"
      redirect_to @article and return
    else
      flash[:error] = "Es gab ein Problem beim Speichern"
      redirect_to :back and return
    end
  end

  def destroy
  end

  def show
    @article = Article.find(params[:id]).decorate
    add_breadcrumb @article.title, article_path(@article)
  end

  private

  def article_frozen?
    article = Article.find(params[:id])
    if article.isfrozen and not has_role(:admin)
      flash[:warning] = "Dieser Artikel wurde von den Administratoren eingeforen und kann nicht bearbeitet werden."
      redirect_to :back and return
    end
  end

  def as_draft?
    params.key? "save-as-draft"
  end

  def require_edit_permissions
    if !is_logged_in?
      flash[:info] = "Bitte #{view_context.link_to('anmelden', login_path, class: "alert-link")} zum Bearbeiten des Artikels."
      persist_position self.controller_name, self.action_name, params[:id]
      redirect_to login_path
    end
  end

  def article_params
    params.require(:article).permit(:title, :alternate_title, :content, :unreleased, :releasedate, :category_list, :genre_list, :comment, :project_activity_state_id, :reviseme)
  end

  def article_admin_params
     params.require(:article).permit(:title, :alternate_title, :content, :unreleased, :releasedate, :category_list, :genre_list, :comment, :project_activity_state_id, :reviseme, :hasftp, :isfrozen, :comments_allowed)
  end


end
