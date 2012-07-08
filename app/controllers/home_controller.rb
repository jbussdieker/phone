class HomeController < ApplicationController
  def call
    render :action => "call.xml.builder", :layout => false
  end
end
