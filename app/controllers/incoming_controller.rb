class IncomingController < ApplicationController
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
    head 200
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end
end
