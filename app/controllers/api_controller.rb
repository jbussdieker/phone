class ApiController < ApplicationController
  def index
    register_call
    render :action => "index.xml.builder", :layout => false
  end

  def read_caller_info
    @called = Number.where(:number => params[:Called]).first
    @caller = Contact.where(:number => params[:Caller]).first
    if @called
      @owner = @called.user
      #@mailbox = @owner.mailboxes.first if @owner
      if params[:Caller] == "+18506637608"
          @mailbox = Mailbox.find(2)
      elsif params[:Caller] == "+19079526114"
          @mailbox = Mailbox.find(1)
      end

      @new_messages = @mailbox.new_messages if @mailbox
      @saved_messages = @mailbox.saved_messages if @mailbox
      @messages = @mailbox.messages if @mailbox
    end
  end

  def register_call
    if params["CallSid"]
      filter_params = params.reject {|key,value|
        !key.in?(["AccountSid", "CallSid", "Caller", "Called", "CallStatus", "CallDuration"])
      }
      @call = Call.where("CallSid" => params["CallSid"]).first
      if @call
        @call.update_attributes(filter_params)
      else
        @call = Call.create(filter_params)
      end
    end
    if params["Caller"]
        @caller = Number.where("number = ?", params["Caller"]).first
    end
  end

  def messages
    read_caller_info
    if @mailbox
      if params[:index]
        @index = params[:index].to_i

        if @messages[@index].new
          @messages[@index].new = false
          @messages[@index].save
          @index = @index - 1
        end

        if params["Digits"] == "4"
          @index = @index - 2
          @index = -1 if @index < 0
        end

        if params["Digits"] == "5"
          @index = @index - 1
          @index = -1 if @index < 0
        end

        if params["Digits"] == "7"
          @messages[@index].delete
          @messages = @mailbox.messages
        else
          @index = @index + 1
        end

        if @index >= @messages.count
          @index = -1
        end
      elsif @messages.count > 0
        @index = 0
      else
        @index = -1
      end

      render :action => "messages.xml.builder", :layout => false
    else
      @quote = "Couldn't find mailbox"
      render :action => "quote.xml.builder", :layout => false
    end
  end

  def mailbox
    read_caller_info
    if @mailbox
      render :action => "mailbox.xml.builder", :layout => false
    else
      @quote = "Couldn't find mailbox"
      render :action => "quote.xml.builder", :layout => false
    end
  end

  def message
    @recording_url = params[:RecordingUrl]
    @caller = params[:Caller]
    mailbox = 1
    if @caller == "+19079526114"
        mailbox = 2
    end

    Message.create(:url => @recording_url, :CallSid => params[:CallSid], :mailbox_id => mailbox, :number => @caller)
    redirect_to api_path
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
    elsif params[:Digits] == "9"
      redirect_to "/api/mailbox"
    else
      redirect_to api_path
    end
  end

  def info
    if params[:Digits] == "0"
      redirect_to api_path
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
      redirect_to api_path
      return
    end

    if params[:Digits] == "1"
      @song_url = "https://s3.amazonaws.com/jbussdieker/music/Don%27t+Worry+Be+Happy.mp3"
    elsif params[:Digits] == "2"
      @song_url = "https://s3.amazonaws.com/jbussdieker/music/I%27ll+Be+Waiting.mp3"
    elsif params[:Digits] == "3"
      @song_url = "https://s3.amazonaws.com/jbussdieker/music/Finally+Moving.mp3"
    elsif params[:Digits] == "4"
      @song_url = "https://s3.amazonaws.com/jbussdieker/music/Flight+180.mp3"
    elsif params[:Digits] == "5"
      @song_url = "https://s3.amazonaws.com/jbussdieker/music/Only+Fools+Rush+In.mp3"
    elsif params[:Digits] == "6"
      @song_url = "https://s3.amazonaws.com/jbussdieker/music/Beds+Are+Burning.mp3"
    end
    render :action => "play.xml.builder", :layout => false
  end
end
