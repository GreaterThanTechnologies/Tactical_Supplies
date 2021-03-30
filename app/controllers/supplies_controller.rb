class SuppliesController < ApplicationController
  before_action(:req_login)
  layout "application"

  def index
    if params[:quantity]
      @supplies = Supply.quantity_search(params[:quantity])
    else
      @supplies = Supply.all
    end
  end

  def edit
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
    @supply.owner = current_owner
    if params[:item_id]
      @supply.item_id = params[:item_id]
    end
    if @supply.save
      redirect_to items_path
    else
      @items = Items.all
      render :new
    end
  end



  private

  def supply_params
    params.require(:supply).permit(:quantity, :unit, :item_id, :name)
  end
end