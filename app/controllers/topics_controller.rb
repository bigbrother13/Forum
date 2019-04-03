class TopicsController < ApplicationController
  before_action :find_topic, only: %i(show edit update destroy)
  before_action :authenticate_user!, except: %i(index show)

  def index
    @topics = Topic.all.order("created_at DESC")
  end

  def show
  end

  def new
    @topic = current_user.topics.build
  end

  def create
    @topic = current_user.topics.build(topic_params)

    if @topic.save
      redirect_to @topic, :notice => '* * * Create success * * *'
    else
      render 'new', :notice => '* * * Not create * * *'
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic, :notice => '* * * Update success * * *'
    else
      render 'edit', :notice => '* * * Not update * * *'
    end
  end

  def destroy
  end

  private

  def find_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :content)
  end
end
