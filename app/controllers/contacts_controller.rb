class ContactsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @contacts = current_user.contacts.all(:order => "name")
  end

  def edit
    @contact = current_user.contacts.find(params[:id])
  end

  def new
    @contact = current_user.contacts.new
  end

  def create
    @contact = current_user.contacts.new(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_path, notice: 'Contact was successfully created.' }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @contact = current_user.contacts.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to contacts_path, notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
end
