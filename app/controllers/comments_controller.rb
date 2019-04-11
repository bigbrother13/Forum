class CommentsController < ApplicationController
  before_action :find_topic, only: [ :create, :edit, :update, :destroy ]
  before_action :find_comment, only: [ :edit, :update, :destroy ]

  def create
    @comment = @topic.comments.create(params[:comment].permit(:comment))
    @comment.user_id = current_user.id if current_user
    @comment.save

    if @comment.save
      redirect_to topic_path(@topic), notice: 'Comment was created'
    else
      render :new, notice: 'Comment was not created'
    end
  end

  def edit
  end

  def update
    if @comment.update(params[:comment].permit(:comment))
      redirect_to topic_path(@topic), :notice => ' Update success '
    else
      render 'edit', :notice => ' Not update '
    end
  end

  def destroy
    @comment.destroy
    redirect_to topic_path(@topic), :notice => ' Destroy success '
  end

  private

  def find_topic
    @topic = Topic.find(params[:topic_id])
  end

  def find_comment
    @comment = @topic.comments.find(params[:id])
  end
end