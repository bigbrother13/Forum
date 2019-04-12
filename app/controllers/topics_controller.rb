class TopicsController < ApplicationController
  before_action :find_topic, only: %i(show edit update destroy)
  before_action :authenticate_user!, except: %i(index show)

  def index
    @topics = Topic.actual
  end

  def show
  end

  def new
    @topic = current_user.topics.build
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      redirect_to @topic, notice: 'Topic was created'
    else
      render :new, error: 'Topic was not created'
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic, notice: 'Topics was updated'
    else
      render :edit, notice: 'Topic was not updated'
    end
  end

   def destroy
    @topic.destroy
    redirect_to topics_path
  end

  private

  def find_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :content, :image)
  end
end
