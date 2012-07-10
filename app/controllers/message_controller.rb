class MessageController < ApplicationController
  before_filter :authenticate_user!

  def index
    @messages = Message.all(:order => 'created_at')
  end
end
