class PhoneApiController < ApplicationController
  def index
    # Get the number they called
    @number = Number.where(:number => params[:Called]).first
    if @number == nil
      @error = "Unrecognized Number!"
      render :action => "error.xml.builder", :layout => false
      return
    end

    # Get the script
    @script = @number.script
    if @script == nil
      @error = "No script associated with this number!"
      render :action => "error.xml.builder", :layout => false
      return
    end

    render :action => "index.xml.builder", :layout => false
  end
end
