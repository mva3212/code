class HomeController < ApplicationController
  def index
    @users = User.all
    @journals = Journal.find(:all)
	@text = "HELLO"
  end
  
  def show
		@user = current_user
		@journals = Journal.find(:all, :conditions => {:user_id => @user.id })
		@farms = Farm.find(:all, :conditions => {:user_id => @user.id })
  end
end
