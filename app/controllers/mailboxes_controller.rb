class MailboxesController < ApplicationController
  before_filter :authenticate_user!

  def base
    #if current_user.admin
    #  Mailbox
    #else
      current_user.mailboxes
    #end
  end

  def index
    @mailboxes = base.all
  end

  def new
    @mailbox = current_user.mailboxes.new
  end

  def edit
    @mailbox = base.find(params[:id])
  end

  def show
    @mailbox = base.find(params[:id])
    @messages = @mailbox.messages.all(:order => 'created_at DESC')
  end

  def create
    @mailbox = current_user.mailboxes.new(params[:mailbox])
    if @mailbox.save
      redirect_to mailboxes_path
    else
      render :action => "new"
    end
  end

  def update
    @mailbox = base.find(params[:id])
    if @mailbox.update_attributes(params[:mailbox])
      redirect_to mailboxes_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @mailbox = base.find(params[:id])
    @mailbox.delete
    redirect_to mailboxes_path
  end
end
