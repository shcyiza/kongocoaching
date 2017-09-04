class MultimediaController < ApplicationController
  before_action :set_crew

  def add_avatar
    @attachable_type = Object.const_get params[:attachable_type]
    @attachable = @attachable_type.find(params[:key])
    @pic = @attachable.avatars.build(avatar_params)
    respond_to do |format|
      if @pic.save(avatar_params)
        format.html { redirect_back fallback_location: root_path, notice: "l'image ajoutée." }
        format.json { render :show, status: :ok, location: @pic }
      else
        format.html { render :edit }
        format.json { render json: @pic.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_videolink
    @watchable_type = Object.const_get params[:watchable_type]
    @watchable = @watchable_type.find(params[:key])
    @vid = @watchable.video_links.build(video_link_params)
    respond_to do |format|
      if @vid.save(video_link_params)
        format.html { redirect_back fallback_location: root_path, notice: "la vidéo a été ajoutée." }
        format.json { render :show, status: :ok, location: @vid }
      else
        format.html { render :edit }
        format.json { render json: @vid.errors, status: :unprocessable_entity }
      end
    end
  end

  def make_this_pic_default
    @pic = Avatar.find(params[:media_id])
    respond_to do |format|
      if @pic == @pic.get_attachable_default
        format.html { redirect_back fallback_location: root_path, alert: "cette images est déja l'image star." }
        format.json { head "cette images est déja l'image star." }
        format.js
      else
        @pic.set_as_default
        format.html { redirect_back fallback_location: root_path, notice: "Image star modifiée." }
        format.json { head "Image star modifié." }
        format.js
      end
    end
  end

  def make_this_vid_default
    @vid = VideoLink.find(params[:media_id])
    respond_to do |format|
      if @vid == @vid.get_watchable_default
        format.html { redirect_back fallback_location: root_path, alert: "cette video est déja la video star." }
        format.json { head "cette video est déja la video star." }
        format.js
      else
        @vid.set_as_default
        format.html { redirect_back fallback_location: root_path, notice: "Video star modifiée." }
        format.json { head "Video star modifiée." }
        format.js
      end
    end
  end

  def update_this_pic
    @pic = Avatar.find(params[:media_id])
    @pic.update(avatar_params)
    respond_to do |format|
      if @pic.update(avatar_params)
        format.html { redirect_back fallback_location: root_path, notice: "l'image a modifiée." }
        format.json { render :show, status: :ok, location: @pic }
      else
        format.html { render :edit }
        format.json { render json: @pic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_this_vid
    @vid = VideoLink.find(params[:media_id])
    @vid.update(video_link_params)
    respond_to do |format|
      if @vid.update(video_link_params)
        format.html { redirect_back fallback_location: root_path, notice: "l'image a modifiée." }
        format.json { render :show, status: :ok, location:@vid }
      else
        format.html { render :edit }
        format.json { render json: @vid.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_videolink
    @video = VideoLink.find(params[:media_id])
    @video.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Le lien youtube a été correctement supprimé.' }
      format.json { head :no_content }
      format.js
    end
  end

  def destroy_picture
    @pic = Avatar.find(params[:media_id])
    @pic.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: "l'image a été correctement supprimé." }
      format.json { head :no_content }
      format.js
    end
  end

  def set_crew
    @crew = Crew.find(params[:id])
    authorize! :destroy, @crew
  end

  def video_link_params
    params.require(:video_link).permit(:video_path)
  end

  def avatar_params
    params.require(:avatar).permit(:photo, :vignette)
  end

end
