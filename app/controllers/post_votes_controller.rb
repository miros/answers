class PostVotesController < ApplicationController

  before_filter :authenticate_user!

  # POST /answers
  def create

    post = Post.find(params[:post_id]) 

    question = (post.respond_to?(:question)) ? post.question() : post

    @post_vote = PostVote.new(:post => post, :user => current_user)

      if @post_vote.save
        respond_to do |format|
          format.html { redirect_to(question, :notice => 'Post was rated successfully') }
          format.js { render :created }
        end
      else
        respond_to do |format|
          format.html { redirect_to(question, :notice => 'Error rating post') }
          format.js { render :error }
        end
      end
  end



end
