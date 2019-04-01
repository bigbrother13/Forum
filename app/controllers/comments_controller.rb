class CommentsController < ApplicationController
	def create
		@topic = Topic.find(params[:topic_id])
		@comment = @topic.comments.create(params[:comment].permit(:comment))

		if @comment.save
			redirect_to topic_path(@topic)
		else
			render 'new'
		end
	end
end
