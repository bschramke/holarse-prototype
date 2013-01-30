class NewscommentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    comment = Comment.new(:user => current_user, :content => params[:comment][:content])
    if comment.save
      news = News.find(params[:news_id])
      news.comments << comment
      if news.save
        redirect_to news_path(params[:news_id]), :notice => "Kommentar erstellt"
      end
    else
      redirect_to news_path(params[:news_id]), :error => "Kommentar nicht erstellt"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
