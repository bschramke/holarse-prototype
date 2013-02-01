class CommentsController < ApplicationController

  before_filter :require_commentable_permissions, :only => :create

  def index
  end

  def create
    # passendes kommentierbares item finden
    if params[:news_id].present? 
      commentable = News.find(params[:news_id])
    elsif params[:article_id].present?
      commentable = Article.find(params[:article_id])
    else
      raise "only news or articles are commentable"
    end

    # kommentar erzeugen
    comment = Comment.new(:user => current_user, :content => params[:comment][:content])
    if comment.save
      commentable.comments << comment
      if commentable.save
        redirect_to commentable, :notice => "Kommentar gespeichert"
      else
        redirect_to commentable, :error => "Fehler beim Speichern des Kommentars"
      end
    end
  end

  def edit
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
end
