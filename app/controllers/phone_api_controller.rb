class PhoneApiController < ApplicationController
  def index
    render :action => "index.xml.builder", :layout => false
  end
end
