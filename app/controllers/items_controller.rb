class ItemsController < ApplicationController

  before_action(:set_item, except: [:index, :new, :create])
  before_action(:req_login)

  layout "application"

  def index
    if params[:owner_id]
      owner = Owner.find_by(id: params[:owner_id])
      @items = owner.items
     else
      @items = Item.all
    end
  end

  def show
  end
  
  def new
    @item = Item.new
    @item.supplies.build(owner: current_owner)
    @supplies = @item.supplies.select{|p| p.owner_id == current_owner.id}
  end

  def create
    @item = Item.new(item_params)
    @item.supplies.each do |p|
      p.owner = current_owner
    end
    if @item.save
        redirect_to item_path(@item)
    else
      @errors = @item.errors.full_messages
      render :new
    end
  end

  def edit
    @supplies = @item.supplies.where(owner_id: current_owner.id)
  end

  def update
    if @item.update(item_params)
      redirect_to(item_path(@item))
    else
      @supplies = @item.supplies.select do |p|
        p.owner_id == current_owner.id
      end
      @errors = @item.errors.full_messages
      render :edit
    end
  end


  def destroy
    @item.delete
    redirect_to items_path
  end

####
  private

    def item_params
      params.require(:item).permit(:name, supplies_attributes: [:unit, :quantity, :owner_id])
    end

    def set_item
      @item = Item.find_by(id: params[:id], name: params[:name])
    end


end