class NumbersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @numbers = current_user.numbers.all(:order => "name")
  end

  def edit
    @number = current_user.numbers.find(params[:id])
  end

  def new
    @number = current_user.numbers.new
  end

  def create
    @number = current_user.numbers.new(params[:number])

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
    @number = current_user.numbers.find(params[:id])

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
