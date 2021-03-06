class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(params[:comment])
    redirect_to @post
  end


  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    respond_with(@comment)
  end

end
