class HomeController < ApplicationController
  def call
    render :action => "call.xml.builder", :layout => false
  end

  def selection
    if params[:Digits] == "0"
      open("http://www.quotesdaddy.com/feed/tagged/Love") do |http|
        response = http.read
        result = RSS::Parser.parse(response, false)
        @quote = result.channel.item.description
        render :action => "quote.xml.builder", :layout => false
        return
      end
    elsif params[:Digits] == "1"
      @song_url = "https://s3.amazonaws.com/jbussdieker/music/All+Around+You.mp3"
    elsif params[:Digits] == "2"
      @song_url = "https://s3.amazonaws.com/jbussdieker/music/Master+Plan.mp3"
    elsif params[:Digits] == "3"
      @song_url = "https://s3.amazonaws.com/jbussdieker/music/Wagon+Wheel.mp3"
    elsif params[:Digits] == "4"
      @song_url = "https://s3.amazonaws.com/jbussdieker/music/Flight+180.mp3"
    elsif params[:Digits] == "5"
      @song_url = "https://s3.amazonaws.com/jbussdieker/music/Only+Fools+Rush+In.mp3"
    end
    render :action => "selection.xml.builder", :layout => false
  end
end
