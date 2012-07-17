class Music::SongsController < ApplicationController
  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new(params[:song])
    if @song.save
      redirect_to music_path
    else
      render "new"
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to music_path
  end
end
