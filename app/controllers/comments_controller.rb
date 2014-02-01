class CommentsController < ApplicationController

  before_filter :requires_login, only: :create
  before_filter :requires_comments_allowed, only: [:edit, :update, :destroy]

  def create
    commentable = get_commentable
    new_comment = commentable.comments.create(comment_params)
    new_comment.user = current_user

    if new_comment.save
      flash[:info] = "Dein Kommentar wurde gespeichert"
      redirect_to commentable
    else
      flash[:error] = "Es gab einen Fehler beim Speichern"
      redirect_to commentable
    end
  end

  private

  def requires_comments_allowed
    redirect_to get_commentable if get_commentable.comments_allowed
  end

  def requires_login
    redirect_to get_commentable if !current_user
  end

  def get_commentable
    Rails.logger.debug(params)
    return Article.friendly.find(params[:article_id]) if params.has_key?(:article_id)
    return News.friendly.find(params[:news_id]) if params.has_key?(:news_id)
    return DiscountEvent.find(params[:discount_event_id]) if params.has_key?(:discount_event_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :article_id, :news_id, :discount_event_id)
  end

end
