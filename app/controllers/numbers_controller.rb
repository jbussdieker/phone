class NumbersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @numbers = Number.all
  end

  def edit
    @number = Number.find(params[:id])
  end

  def new
    @number = Number.new
  end

  def create
    @number = Number.new(params[:number])

    respond_to do |format|
      if @number.save
        format.html { redirect_to numbers_path, notice: 'Number was successfully created.' }
        format.json { render json: @number, status: :created, location: @number }
      else
        format.html { render action: "new" }
        format.json { render json: @number.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @number = Number.find(params[:id])

    respond_to do |format|
      if @number.update_attributes(params[:number])
        format.html { redirect_to numbers_path, notice: 'Number was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @number.errors, status: :unprocessable_entity }
      end
    end
  end
end
