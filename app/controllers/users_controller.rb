class UsersController < ApplicationController
  def show

    user_bookmarks = current_user.bookmarks.all
    @user_bookmarks_by_topic_id = user_bookmarks.group_by(&:topic_id)

    @topics = Topic.all
    #liked_book = current_user.likes.includes(:bookmark)
    liked_bookmarks = current_user.likes.collect(&:bookmark)
    @user_liked_bookmarks_by_topic_id = liked_bookmarks.group_by(&:topic_id)

  end

end
