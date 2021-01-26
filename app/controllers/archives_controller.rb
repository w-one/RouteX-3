class ArchivesController < ApplicationController

  def create
    archive = current_user.archives.create(note_id: params[:note_id]) #user_idとnote_idの二つを代入
    redirect_back(fallback_location: root_path)
  end

  def destroy
    archive = Archive.find_by(note_id: params[:note_id], user_id: current_user.id)
    archive.destroy
    redirect_back(fallback_location: root_path)
  end

end
