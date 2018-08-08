class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_topic

  def show
    @bookmark = @topic.bookmarks.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @topic.bookmarks.build(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark added"
      redirect_to @topic
    else
      flash[:alert] = "Bookmark was not saved. Please try again"
      render :new
    end
  end

  def edit
    @bookmark = @topic.bookmarks.find(params[:id])
  end

  def update
    @bookmark = @topic.bookmarks.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark was updated"
      redirect_to @topic
    else
      flash[:alert] = "Bookmark was not updated. Please try again"
      render :edit
    end
  end

  def destroy
    @bookmark = @topic.bookmarks.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted."
      redirect_to @topic
    else
      flash[:alert] = "There was an error. Please try again."
      render :edit
    end
  end
end

private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

  def get_topic
    @topic = Topic.find(params[:topic_id])
  end
