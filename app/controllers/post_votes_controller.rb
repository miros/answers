class PostVotesController < ApplicationController

  before_filter :authenticate_user!

  # POST /answers
  def create

    @post = Post.find(params[:post_id])

    rating = case params[:rating]
      when 'up'
        1
      when 'down'
        -1
    end

    question = (@post.respond_to?(:question)) ? @post.question() : @post
 
    @post_vote = PostVote.find_or_initialize_by_post_id_and_user_id(:post_id => @post.id, :user_id => current_user.id)
    @post_vote.rating = rating

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
