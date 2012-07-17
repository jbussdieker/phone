class Music::MusicController < ApplicationController
  def index
    @artists = Artist.all
  end
end
