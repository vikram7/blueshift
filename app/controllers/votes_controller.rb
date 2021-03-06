class VotesController < ApplicationController
  before_filter :authenticate_user!

  def upvote
    @vote = Vote.find_or_initialize_by(user: current_user, review: Review.find(params["id"]))
    @vote.score = 1
    @vote.save

    redirect_to show_path(Review.find(params["id"]).show.id)
  end

  def downvote
    @vote = Vote.find_or_initialize_by(user: current_user, review: Review.find(params["id"]))
    @vote.score = -1
    @vote.save

    redirect_to show_path(Review.find(params["id"]).show.id)
  end
end
