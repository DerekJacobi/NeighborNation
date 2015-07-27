class ForumsController < ApplicationController
  before_action :fetch_all_forum, only: [:index, :show, :update]
  before_action :fetch_all_classifieds, only: [:index, :show, :update]
  before_action :fetch_all_requests, only: [:index, :show, :update]
  before_action :fetch_all_announcements, only: [:index, :show, :update]
  before_action :fetch_forum, only: [:destroy, :update]

  def show
    render 'forum/new'
  end

  def create
    if !current_user
      redirect_to new_session_path
    else
    @new_forum = Forum.new(forum_params)
    @new_forum.user_id = current_user.id
    @new_forum.save
    redirect_to forum_path(current_user.id)
    end
  end

  def update

    respond_to do |format|
      if @forum.update(forum_params)
       format.html { redirect_to forum_path(current_user.id), notice: 'Forum post was successfully updated.' }
       format.json { render :json => @forum }
      else
        format.html { redirect_to forum_path(current_user.id), notice: "Unable to update forum post." }
      end
    end
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

  def fetch_all_announcements
    @announcements_count = Forum.where(forum_type: "announcement").count
  end

  def fetch_all_forum
    @all_forum = Forum.all
  end

  def forum_params
    params.require(:forum).permit(:forum_type, :topic, :content)
  end

end
