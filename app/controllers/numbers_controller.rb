class NumbersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @numbers = Number.all
  end

  def edit
    @number = Number.find(params[:id])
  end
end
