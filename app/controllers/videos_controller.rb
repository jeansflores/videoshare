class VideosController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: :show
  before_action :set_video, only: [:show, :edit, :update, :destroy, :add_view]
  before_action :is_owner?, only: [:destroy, :update]

  def index
    @videos = Video.where(user: current_user)
  end

  def show
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to videos_path, notice: 'Video was successfully created.' }
        format.json { render :index, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to videos_path, notice: 'Video was successfully updated.' }
        format.json { render :index, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_view
    @video.add_view
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:name, :url, :user_id)
  end

  def is_owner?
    unless current_user == @video.user
      respond_to do |format|
        format.json { render json: false, status: :forbidden }
        format.html { redirect_to main_app.root_url }
      end
    end
  end
end
