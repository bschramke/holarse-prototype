class CommentsController < ApplicationController

  before_filter :require_commentable_permissions, :only => :create
  before_filter :require_comment_edit_permissions, :only => [:edit, :update, :destroy]

  def index
  end

  def create
    # passendes kommentierbares item finden
    commentable = get_commentable_object

    # kommentar erzeugen
    comment = Comment.new(:user => current_user, :content => params[:comment][:content])
    if comment.save
      commentable.comments << comment
      if commentable.save
        redirect_to url_for(commentable) + "#comment-#{comment.id}", :notice => "Kommentar gespeichert" // FIXME
      else
        redirect_to commentable, :error => "Fehler beim Speichern des Kommentars"
      end
    end
  end

  def update
    commentable = get_commentable_object
    comment = Comment.find(params[:id])
    redirect_to commentable, :error => "Kann den Kommentar nicht bearbeiten" if !can_edit_comment?(comment) and return

    comment.content = params[:comment][:content]
    if comment.save
      redirect_to url_for(commentable) + "#comment-#{comment.id}", :notice => "Kommentar aktualisiert" // FIXME
    else
      redirect_to commentable, :error => "Fehler beim Speichern des Kommentars"
    end 
  end

  def edit
    @commentable_object = get_commentable_object
    @comment = Comment.find(params[:id])

    redirect_to commentable, :error => "Kann den Kommentar nicht bearbeiten" if !can_edit_comment?(@comment) and return
  end

  def destroy
  end

  private

  # laedt das entsprechende objekt anhand der unterschiedlichen uebergaben
  def get_commentable_object
    return News.find(params[:news_id]) if params[:news_id].present?
    return Article.find(params[:article_id]) if params[:article_id].present?
    raise "Only news or articles are commentable"
  end

  # ueberprueft, ob das commentable-objekt kommentiert werden darf
  def require_commentable_permissions
    obj = get_commentable_object

    redirect_to obj, :warning => "Kommentarfunktion ist hier gesperrt." if !obj || !obj.commentable
  end

  # ueberprueft ob der kommentar bearbeitet werden darf
  def require_comment_edit_permissions
    can_edit_comment? Comment.find(params[:id])    
  end
end
