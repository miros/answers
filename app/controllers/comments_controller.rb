class CommentsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @comment = current_user.comments.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { render :text => 'Comment was successfully created.' }
        format.js
      else
        msg = 'Error creating comment: ' + @comment.errors.full_messages.join(', ')
        format.html { render :text => msg }
        format.js  { render :text => "alert(\"#{msg}\");" }
      end
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { render :text => 'Comment deleted.' }
      format.js
    end
  end
end
