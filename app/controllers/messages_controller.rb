class MessagesController < ApplicationController
  def destroy
    @mailbox = Mailbox.find(params[:mailbox_id])
    @message = Message.find(params[:id])
    @message.delete
    redirect_to @mailbox
  end
end
