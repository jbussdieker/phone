class HomeController < ApplicationController
  def index
    @messages = Message.all(:order => 'created_at')
  end

  def call
    render :action => "index.xml.builder", :layout => false
  end

  def menu
    if params[:Digits] == "1"
      render :action => "music.xml.builder", :layout => false
    elsif params[:Digits] == "2"
      render :action => "info.xml.builder", :layout => false
    elsif params[:Digits] == "3"
      account_sid = Rails.configuration.twilio_sid
      auth_token = Rails.configuration.twilio_token
      my_number = '+14155992671'
      @client = Twilio::REST::Client.new account_sid, auth_token
      @client.account.sms.messages.create(
        :from => my_number,
        :to => "+19079526114",
        :body => "Page from Gena!!!"
      )
      render :action => "page.xml.builder", :layout => false
    elsif params[:Digits] == "4"
      render :action => "message.xml.builder", :layout => false
    elsif params[:Digits] == "5"
      render :action => "special.xml.builder", :layout => false
    else
      redirect_to '/call'
    end
  end

  def info
    if params[:Digits] == "0"
      redirect_to '/call'
      return
    end

    if params[:Digits] == "1"
      open("http://www.quotesdaddy.com/feed/tagged/Love") do |http|
        response = http.read
        result = RSS::Parser.parse(response, false)
        @quote = result.channel.item.description
      end
    elsif params[:Digits] == "2"
      open("http://rss.weather.com/weather/rss/local/USFL0076?cm_ven=LWO&cm_cat=rss&par=LWO_rss") do |http|
        response = http.read
        result = RSS::Parser.parse(response, false)
        @quote = result.channel.items[-1].description.gsub(";F", " Fahrenheit ")
        @quote = @quote.gsub("&deg", " Degrees ")
        @quote = @quote.gsub(" / ", " ")
        @quote = @quote.gsub(" Mon:", " Monday ")
        @quote = @quote.gsub(" Tue:", " Tuesday ")
        @quote = @quote.gsub(" Wed:", " Wednesday ")
        @quote = @quote.gsub(" Thur:", " Thursday ")
        @quote = @quote.gsub(" Fri:", " Friday ")
        @quote = @quote.gsub(" Sat:", " Saturday ")
        @quote = @quote.gsub(" Sun:", " Sunday ")
      end
    end
    render :action => "quote.xml.builder", :layout => false
  end

  def music
    if params[:Digits] == "0"
      redirect_to '/call'
      return
    end

    if params[:Digits] == "1"
      @song_url = "https://s3.amazonaws.com/jbussdieker/music/All+Around+You.mp3"
    elsif params[:Digits] == "2"
      @song_url = "https://s3.amazonaws.com/jbussdieker/music/Master+Plan.mp3"
    elsif params[:Digits] == "3"
      @song_url = "https://s3.amazonaws.com/jbussdieker/music/Finally+Moving.mp3"
    elsif params[:Digits] == "4"
      @song_url = "https://s3.amazonaws.com/jbussdieker/music/Flight+180.mp3"
    elsif params[:Digits] == "5"
      @song_url = "https://s3.amazonaws.com/jbussdieker/music/Only+Fools+Rush+In.mp3"
    end
    render :action => "play.xml.builder", :layout => false
  end

  def message
    @recording_url = params[:RecordingUrl]
    Message.create(:url => @recording_url)
    redirect_to '/call'
  end
end
