class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create


    @sender = params[:sender]
    @title = params[:subject]
    @url = params["body-plain"]



    @user = User.where(email: @sender).first_or_create!
    @topic = @user.topics.where(title: @title).first_or_create!
    @bookmark = @topic.bookmarks.new(url: @url)

    if @bookmark.save
      puts "#{@bookmark.url} was succesfully created"
    else
      puts "#{@bookmark.url} there was error creating the topic"
    end

#     if User.exists?(email: @sender)
#       if Topic.exists?(title: @title)
#
#
#         @user = User.find_by(email: @sender)
#         @topic = Topic.find_by(title: @title)
#         @bookmark = Bookmark.new(url: @url)
#         @bookmark.topic = @topic
#
#         if @bookmark.save
#           puts "#{@bookmark.url} was succesfully created"
#         else
#           puts "#{@bookmark.url} there was error creating the topic"
#         end
#
#       else
#         @user = User.find_by(email: @sender)
#         @topic = Topic.new(title: @title)
#         @topic.user= @user
#
#         if @topic.save
#           puts "#{@topic.title} was succesfully created"
#         else
#           puts "#{@topic.title} there was error creating the topic"
#         end
#
#         @bookmark = Bookmark.new(url: @url)
#         @bookmark.topic = @topic
#
#         if @bookmark.save
#           puts "#{@bookmark.url} was succesfully created"
#         else
#           puts "#{@bookmark.url} there was error creating the topic"
#         end
#
#       end
#     else
# ###################################################################################################################
#       puts "THE USER DOES NOT EXIST, FALSE!"
#       @user = User.new(email: @sender)
#       @user.save
#
#
# # All of this is repeated, there has to be a better way
#       if Topic.exists?(title: @title)
#         @topic = Topic.find_by(title: @title)
#         @bookmark = Bookmark.new(url: @url)
#         @bookmark.topic = @topic
#
#         if @bookmark.save
#           puts "#{@bookmark.url} was succesfully created"
#         else
#           puts "#{@bookmark.url} there was error creating the topic"
#         end
#
#       else
#         @topic = Topic.new(title: @title)
#         @topic.user= @user
#
#         if @topic.save
#           puts "#{@topic.title} was succesfully created"
#         else
#           puts "#{@topic.title} there was error creating the topic"
#         end
#
#         @bookmark = Bookmark.new(url: @url)
#         @bookmark.topic = @topic
#
#         if @bookmark.save
#           puts "#{@bookmark.url} was succesfully created"
#         else
#           puts "#{@bookmark.url} there was error creating the topic"
#         end
#
#       end
#
#     end

    # You put the message-splitting and business
    # magic here.
     # Find the user by using params[:sender]
     # Find the topic by using params[:subject]
     # Assign the url to a variable after retreiving it from params["body-plain"]

     # Check if user is nil, if so, create and save a new user

     # Check if the topic is nil, if so, create and save a new topic

     # Now that you're sure you have a valid user and topic, build and save a new bookmark

    # Assuming all went well.
    head 200
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end
end

#TODO delete comments for final build.
#TODO clean this mess up
