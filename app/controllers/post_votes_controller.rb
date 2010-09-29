class PostVotesController < ApplicationController

  before_filter :authenticate_user!

  rescue_from PostVote::AlreadyVotedError, :with => :render_error_already_voted
  rescue_from ActiveRecord::ActiveRecordError, :with => :render_error_creating

  # POST /answers
  def create

    @post = Post.find(params[:post_id])
    @question = @post.respond_to?(:question) ? @post.question : @post

    @post.vote(current_user, get_numeric_rating);

    respond_to do |format|
      format.html { redirect_to(@question, :notice => 'Post was rated successfully') }
      format.js { render :created }
    end

  end

  private

    def render_error_already_voted
      respond_to do |format|
        format.html { redirect_to(@question, :error => 'You have already voted for post') }
        format.js { render :already_voted }
      end
    end

    def render_error_creating
      respond_to do |format|
        format.html { redirect_to(@question, :error => 'Error rating post') }
        format.js { render :error }
      end
    end

    def get_numeric_rating
      case params[:rating]
        when 'up'
          1
        when 'down'
          -1
      end
    end


end
