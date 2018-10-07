class TopicsController < ApplicationController
  before_action :authenticate_user!

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

def new
  @topic = Topic.new
end

  def create
    @topic = current_user.topics.new(topic_params)
    authorize @topic

    if @topic.save
      flash[:notice]="\"#{@topic.title}\" was created."
      redirect_to @topic
    else
      flash.now[:alert]="There was an error saving the topic. Please try again."
      redirect_to @topic
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic

    @topic.assign_attributes(topic_params)

    if @topic.save
        flash[:notice] = "\"#{@topic.title}\" was updated."
        redirect_to @topic
    else
        flash.now[:alert] = "There was an error saving the topic. Please try again"
        render :edit
    end
  end

  def destroy
    @topic  = Topic.find(params[:id])
    authorize @topic

    if @topic.destroy
      flash[:notice]="\"#{@topic.title}\"was deleted."
      redirect_to topics_path
    else
      flash[:alert]="There was an error deleting the topic. Please try again."
      render :show
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end
end
