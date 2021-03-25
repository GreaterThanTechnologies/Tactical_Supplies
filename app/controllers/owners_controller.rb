class OwnersController < ApplicationController

  def new
    @owner = Owner.new
  end

  def home
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      session[:owner_id] = @owner.id
      redirect_to owner_items_path(@owner)
    else
      @errors = @owner.errors.full_messages
      render :new
    end
  end




  private

  def owner_params
    params.require(:owner).permit(:username, :name, :company_name, :password, :password_confirmation)
  end

end