class MusicController < ApplicationController
  def index
    begin
      @songs = []
      # It's silly but this updates the global list so the api calls are faster
      $aws_bucket = AWS::S3::Bucket.find("phone_music")
      @objects = $aws_bucket.objects
      @objects.each do |obj|
        if obj.key.split("/").length > 1
          @songs << {
            artist: obj.key.split("/")[0],
            title: obj.key.split("/")[1][0..-5],
            url: AWS::S3::S3Object.url_for(obj.key, "phone_music")
          }
        end
      end
    rescue Exception => e
      @error = e
      return
    end
  end

  def destroy
    begin
      #AWS::S3::S3Object.delete params[:id], params[:bucket_id]
    rescue Exception => e
      @error = e
      index
      render "index"
      return
    end
    redirect_to music_index_path
  end

  def create
    filename = params[:song][:file].original_filename
    if filename.split("-").length > 1
      artist, title = filename.split("-")
      artist.strip!
      title.strip!
    else
      artist = "Unknown"
      title = filename
    end
    begin
      AWS::S3::S3Object.store "#{artist}/#{title}", params[:song][:file], "phone_music"
    rescue Exception => e
      @error = e
      render "new"
      return
    end
    redirect_to music_index_path
  end
end
