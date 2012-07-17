class Music::ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.new(params[:artist])
    if @artist.save
      redirect_to music_path
    else
      render "new"
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to music_path
  end
end
