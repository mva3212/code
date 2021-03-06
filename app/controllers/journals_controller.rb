class JournalsController < ApplicationController
load_and_authorize_resource
before_filter :set_current_user

private
def set_current_user
	@user = current_user
end

public	
  # GET /journals
  # GET /journals.xml
  def index
    @journals = Journal.all
    respond_with(@user,@journals)
  end

  # GET /journals/1
  # GET /journals/1.xml
  def show
    @journal = Journal.find(params[:id])
    @posts = Post.find(:all, :conditions => { :journal_id => @journal.id })
    if request.path != (journal_path(@journal) )
			redirect_to @journal, status: :moved_permanently
		end
    respond_with(@journal,@posts)
  end

  # GET /journals/new
  # GET /journals/new.xm

	def new
    @journal = Journal.new(:user_id => @user.id)
    respond_with(@user,@journal)
  end

  # GET /journals/1/edit
  def edit
    @journal = Journal.find(params[:id])
  end

  # POST /journals
  # POST /journals.xml
  def create
    @journal = Journal.new(params[:journal])
    @journal.save
    respond_with(@journal)
  end

  # PUT /journals/1
  # PUT /journals/1.xml
  def update
    @journal = Journal.find(params[:id])
    @journal.update_attributes(params[:journal])
    respond_with(@user,@journal)
  end

  # DELETE /journals/1
  # DELETE /journals/1.xml
  def destroy
    @journal = Journal.find(params[:id])
    @journal.destroy
    respond_with(@user,@journal)
  end
end
