class CommentsController < ApplicationController
  before_action :fetch_all_comments, only: [:show, :update]

  def create
    @forum_post = Forum.find(params[:forum_id])

    @new_comment = @forum_post.comments.create(comment_params)
    @new_comment.user_id = current_user.id
    @new_comment.save
    redirect_to forum_path(current_user.id)
  end

  def update
    @comment.update(comment_params)
    redirect_to forum_path(current_user.id)
  end

  def destroy
    @comment.destroy
    redirect_to forum_path(current_user.id)
  end

  private

  def fetch_all_comments
    @all_comments = Comment.all
  end

  def fetch_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
