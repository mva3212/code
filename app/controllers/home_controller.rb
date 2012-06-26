class HomeController < ApplicationController
  def index
    @users = User.all
    @journals = Journal.find(:all)
  end
  
  def show
		@user = current_user
		@journals = Journal.find(:all, :conditions => {:user_id => @user.id })
  end
end
