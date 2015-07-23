class ForumsController < ApplicationController
  before_action :fetch_all_forum, only: [:index, :show, :update]
  before_action :fetch_all_classifieds, only: [:index, :show, :update]
  before_action :fetch_all_requests, only: [:index, :show, :update]
  before_action :fetch_forum, only: [:destroy]

  def show
    render 'forum/new'
  end

  def create
    @new_forum = Forum.new(forum_params)
    @new_forum.user_id = current_user.id

    if @new_forum.save
      redirect_to forum_path(current_user.id)
    else
      redirect_to new_session_path
    end
  end

  def update
    @forum.update(forum_params)
    redirect_to forum_path(current_user.id)
  end

  def destroy
    @forum.destroy
    redirect_to forum_path(current_user.id)
  end



  private

  def fetch_forum
    @forum = Forum.find(params[:id])
  end

  def fetch_all_classifieds
    @classifieds_count = Forum.where(forum_type: "classified").count
  end

  def fetch_all_requests
    @requests_count = Forum.where(forum_type: "request").count
  end

  def fetch_all_forum
    @all_forum = Forum.all
  end


  def forum_params
    params.require(:forum).permit(:forum_type, :topic, :content)
  end

end
