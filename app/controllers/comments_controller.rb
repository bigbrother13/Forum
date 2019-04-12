class CommentsController < ApplicationController
  before_action :find_topic, only: %i(create edit update destroy)
  before_action :find_comment, only: %i(edit update destroy)

  def create
    @comment = @topic.comments.build(comment_params)
    if @comment.save
      redirect_to topic_path(@topic), notice: 'Comment was created'
    else
      render :new, notice: 'Comment was not created'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to topic_path(@topic), notice: 'Comment was updated'
    else
      render :edit, notice: 'Comment was not updated'
    end
  end

  def destroy
    @comment.destroy
    redirect_to topic_path(@topic), notice: 'Comment was deleted'
  end

  private

  def find_topic
    @topic = Topic.find(params[:topic_id])
  end

  def find_comment
    @comment = @topic.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end
end
