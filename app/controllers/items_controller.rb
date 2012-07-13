class ItemsController < ApplicationController
  def index
    @script = Script.find(params[:script_id])
    @items = @script.items
  end

  def new
    @script = Script.find(params[:script_id])
    @item = @script.items.new
  end

  def edit
    @script = Script.find(params[:script_id])
    @item = Item.find(params[:id])
  end

  def update
    @script = Script.find(params[:script_id])
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to script_items_path(@script), notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @script = Script.find(params[:script_id])
    @item = @script.items.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to script_path(@script), notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @script = Script.find(params[:script_id])
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to script_items_url }
      format.json { head :no_content }
    end
  end
end

