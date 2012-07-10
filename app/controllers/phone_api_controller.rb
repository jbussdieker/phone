class PhoneApiController < ApplicationController
  def index
    # Get the number they called
    @number = Number.where(:number => params[:Called]).first
    if @number == nil
      render :action => "error.xml.builder", :layout => false
      return
    end

    # Get the script
    render :action => "index.xml.builder", :layout => false
  end
end
