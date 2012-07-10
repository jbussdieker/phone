class ScriptsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @scripts = Script.all
  end

  def new
    @script = Script.new
  end

  def edit
    @script = Script.find(params[:id])
  end

  def show
    @script = Script.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @script }
    end
  end

  def update
    @script = Script.find(params[:id])

    respond_to do |format|
      if @script.update_attributes(params[:script])
        format.html { redirect_to scripts_path, notice: 'Script was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @script = Script.new(params[:script])

    respond_to do |format|
      if @script.save
        format.html { redirect_to scripts_path, notice: 'Script was successfully created.' }
        format.json { render json: @script, status: :created, location: @script }
      else
        format.html { render action: "new" }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @script = Script.find(params[:id])
    @script.destroy

    respond_to do |format|
      format.html { redirect_to scripts_url }
      format.json { head :no_content }
    end
  end
end
