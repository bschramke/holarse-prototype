class ServiceController < ApplicationController
  
  respond_to :json
  
  def minecraft
    @users = User.all_of(:minecraft_active => true, :minecraft_username.ne => "")
    respond_to do |format|
      format.json { render :json => @users.to_json(:only => [:minecraft_username]) }
    end    
  end
end
