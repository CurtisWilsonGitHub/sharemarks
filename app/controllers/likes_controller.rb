class LikesController < ApplicationController

  def index
    @likes = Like.all
  end

  def new
    @like = Like.new
  end

  def create
    bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark_id: bookmark.id)

    if like.save
      flash[:notice] = "Bookmark was liked."
      redirect_to [bookmark.topic, bookmark]
    else
      flash[:alert] = "There was an error liking the bookmark."
      redirect_to [bookmark.topic, bookmark]
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:bookmark_id])
    like = bookmark.likes.where(user_id: current_user.id).first
    # like = Like.where(bookmark_id: @bookmark.id , user_id: @user.id).take

    if like.destroy
      flash[:notice] = "Bookmark was unliked."
      redirect_to [bookmark.topic, bookmark]
    else
      flash[:notice] = "There was an error. Please Try again."
      redirect_to [bookmark.topic, bookmark]
    end
  end
end
