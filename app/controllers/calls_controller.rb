class CallsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @calls = Call.all
  end

  def destroy
    @call = Call.find(params[:id])
    @call.delete

    respond_to do |format|
      format.html { redirect_to calls_url }
      format.json { head :ok }
    end
  end
end
