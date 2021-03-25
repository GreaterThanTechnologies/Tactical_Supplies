class SuppliesController < ApplicationController
  layout "application"

  def index
    if params[:quantity]
      @supplies = Supply.quantity_search(params[:quantity])
    else
      @supplies = Supply.all
    end
  end

  def new
    if params[:item_id]
      @item = Item.find_by(id: params[:item_id])
      @supply = @item.supplies.build
      @items = Item.all
    else
      @supply = Supply.new
      @items = Item.all
    end

  end

  def create
    @supply = Supply.create(supply_params)
    @supply.user = current_user
    if params[:item_id]
      @supply.item_id = params[:item_id]
    end
    @supply.save
    redirect_to items_path
  end



  private

  def supply_params
    params.require(:measurement).permit(:quantity, :unit, :item_id)
  end
end
