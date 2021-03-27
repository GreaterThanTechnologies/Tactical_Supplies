module SuppliesHelper

  def show_item_name(p, index)
    p.item.name if index
  end

  def form_url_helper(item)
    item ? item_supplies_path(item) : login_path
  end


end
